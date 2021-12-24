import Quantum from "./quantum";

document.addEventListener('DOMContentLoaded', () => {

    const domEl = document.getElementById('circuit')
    if (domEl) {
        let text = domEl.getAttribute('data-scheme')
        if (text === '') text = "I-I-I-I!I-I-I-I!I-I-I-I";
        text = text.replaceAll('!', "\n")

        const circuit = Quantum(text)
        circuit.name = 'circuit'
        circuit.toDom(domEl, false)


        Array
            .from(document.querySelectorAll('.Q-circuit-palette'))
            .forEach(function (el) {

                Quantum.Circuit.Editor.createPalette(el)
            })

        const reportEl = document.getElementById('circuit-report')

        if (reportEl) {
            circuit.evaluate$()
            reportEl.innerText = circuit.report$()
        }

        document.addEventListener("gateHasBeenOperated", () => {
            if (circuit) circuit.evaluate$()
            if (reportEl) reportEl.innerText = circuit.report$()
        })

        const
            toggle_public = document.getElementById('btnpublic_label'),
            toggle_private = document.getElementById('btnprivate_label'),
            hidden_published = document.getElementById('circuit_published'),
            hidden_scheme = document.getElementById('circuit_scheme'),
            form = document.getElementsByClassName('edit_circuit')[0] || document.getElementById('new_circuit'),
            spinner = document.getElementById("spinner")

        console.log(form)

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
    }
})