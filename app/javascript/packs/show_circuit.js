import Quantum from "./quantum";

document.addEventListener('DOMContentLoaded', () => {

    const domEl = document.getElementById('circuit')

    let text = domEl.getAttribute('data-scheme')
    text = text.replaceAll('!', "\n")
    if (text !== '') {
        const circuit = Quantum(text)
        circuit.name = 'circuit'
        if (domEl) {
            circuit.toDom(domEl, true)
            circuit.evaluate$()
        }
        const reportEl = document.getElementById( 'circuit-report' )
        if( reportEl ) reportEl.innerText = circuit.report$()
    }
})
