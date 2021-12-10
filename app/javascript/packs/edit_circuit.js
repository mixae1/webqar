import Quantum from "./quantum";

let circuit;
let reportEl;

document.addEventListener('DOMContentLoaded', () => {

    const domEl = document.getElementById('circuit')
    if( domEl ){
        let text = domEl.getAttribute('data-scheme')
        text = text.replaceAll('!', "\n")

        circuit = Quantum(text)
        circuit.name = 'circuit'
        circuit.toDom(domEl, false)


        Array
            .from( document.querySelectorAll( '.Q-circuit-palette' ))
            .forEach( function( el ){

                Quantum.Circuit.Editor.createPalette( el )
            })

        reportEl = document.getElementById( 'circuit-report' )

        if( reportEl ){
            circuit.evaluate$()
            reportEl.innerText = circuit.report$()
        }
    }
})

document.addEventListener("gateHasBeenOperated", () => {
    if(circuit) circuit.evaluate$()
    if(reportEl) reportEl.innerText = circuit.report$()
})

document.addEventListener('submit', () => {
    if( circuit ) document.getElementById('circuit_scheme')[0].value = circuit.toText()
})