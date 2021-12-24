import Quantum from "./quantum";

document.addEventListener('DOMContentLoaded', () => {

    const domEl = document.getElementById('circuit-readonly')
    if (domEl) {
        let text = domEl.getAttribute('data-scheme')
        if (text === '') text = "I-I-I-I!I-I-I-I!I-I-I-I";
        text = text.replaceAll('!', "\n")

        const circuit = Quantum(text)
        circuit.name = 'circuit'
        circuit.toDom(domEl, true)
        circuit.evaluate$()

        const reportEl = document.getElementById('circuit-report')
        if (reportEl) reportEl.innerText = circuit.report$()

        const
            toggle_public = document.getElementById('btnpublic_label'),
            toggle_private = document.getElementById('btnprivate_label'),
            hidden_published = document.getElementById('circuit_published'),
            form = document.getElementsByClassName('edit_circuit')[0],
            spinner = document.getElementById("spinner")

        if (toggle_public && hidden_published && form) toggle_public.addEventListener('click', function (e) {
            hidden_published.value = true
            spinner.hidden = false
            const response = updateCircuit(form, {
                'published': true,
            }).then((response) => {
                spinner.hidden = true
                console.log(response)
                if(response["status"] !== 200) e.preventDefault()
            })
        })

        if (toggle_private && hidden_published && form) toggle_private.addEventListener('click', function (e) {
            hidden_published.value = false
            spinner.hidden = false
            updateCircuit(form, {
                'published': false,
            }).then((response) => {
                spinner.hidden = true
                console.log(response)
                if(response["status"] !== 200) e.preventDefault()
            })
        })
    }
})

function getAuthToken(){
    return document.getElementById("authenticity_token").value
}

async function updateCircuit(form, _circuit){
    const response = await fetch(form.action, {
        method: "PATCH",
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': getAuthToken(),
        },
        body: JSON.stringify({
            _method: "patch",
            authenticity_token: getAuthToken(),
            circuit: _circuit
        })

    })
    return await response
}