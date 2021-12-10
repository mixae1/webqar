import Quantum from "./quantum";

document.addEventListener('DOMContentLoaded', () => {

    const domEl = document.getElementById('circuit-readonly')
    if( domEl ){
        let text = domEl.getAttribute('data-scheme')
        text = text.replaceAll('!', "\n")
        if (text !== '') {
            const circuit = Quantum(text)
            circuit.name = 'circuit'
            circuit.toDom(domEl, true)
            circuit.evaluate$()

            const reportEl = document.getElementById( 'circuit-report' )
            if( reportEl ) reportEl.innerText = circuit.report$()
        }
    }

})
