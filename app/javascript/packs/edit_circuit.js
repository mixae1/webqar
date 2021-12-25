import Quantum from "./quantum";

document.addEventListener('DOMContentLoaded', () => {

    const domEl = document.getElementById('circuit')
    if (domEl) {
        let text = domEl.getAttribute('data-scheme')
        if (text === '') text = "I-I-I-I!I-I-I-I!I-I-I-I";
        text = text.replaceAll('!', "\n")

        let circuit = Quantum(text)
        circuit.name = 'circuit'
        circuit.toDom(domEl, false)

        Array
            .from(document.querySelectorAll('.Q-circuit-palette'))
            .forEach(function (el) {

                Quantum.Circuit.Editor.createPalette(el)
            })

        window.addEventListener("Q gui altered circuit", () => {
            if (circuit) circuit.evaluate$()
        })

        window.addEventListener( 'Q.Circuit.evaluate completed', function( event ){
            if (reportEl) reportEl.innerText = circuit.report$()
        })

        const reportEl = document.getElementById('circuit-report')
        if (reportEl) {
            if(circuit) circuit.evaluate$()
        }

        const
            toggle_public = document.getElementById('btnpublic_label'),
            toggle_private = document.getElementById('btnprivate_label'),
            hidden_published = document.getElementById('circuit_published'),
            hidden_scheme = document.getElementById('circuit_scheme'),
            form = document.getElementsByClassName('edit_circuit')[0] || document.getElementById('new_circuit'),
            spinner = document.getElementById("spinner")

        if (toggle_public && hidden_published && form) toggle_public.addEventListener('click', function () {
            hidden_published.value = true
        })

        if (toggle_private && hidden_published && form) toggle_private.addEventListener('click', function () {
            hidden_published.value = false
        })

        if (form) form.addEventListener("submit", () => {
            if(spinner) spinner.hidden = false
            if(hidden_scheme) hidden_scheme.value = circuit.toText().substr(1)
        })

        if (form) form.addEventListener("ajax:success", (e) => {
            //const [data, status, xhr] = e.detail;
        })


        if (form) form.addEventListener("ajax:complete", () => {
            if(spinner) spinner.hidden = true
        })

        function redrawCircuit(){
            if(circuit){
                while( domEl.lastChild ){

                    domEl.removeChild( domEl.lastChild )
                }
                circuit.toDom(domEl, false)
            }
        }

        document.addEventListener("addMoment", () => {
            text = circuit.toText().substr(1)
            text = text.replaceAll('\n', '-I\n')
            if(!text.match(/\n$/)){
                text += "-I"
            }
            circuit = Quantum.Circuit.fromText(text)
            redrawCircuit()
        })

        document.addEventListener("addRegister", () => {
            circuit.bandwidth++
            circuit.qubits.push( Quantum.Qubit.HORIZONTAL )
            redrawCircuit()
        })
    }
})