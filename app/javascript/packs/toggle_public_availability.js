document.addEventListener('DOMContentLoaded', () => {
    const
        toggle_public = document.getElementById('btnpublic_label'),
        toggle_private = document.getElementById('btnprivate_label'),
        hidden_published = document.getElementById('circuit_published'),
        form = document.getElementsByClassName('edit_circuit')[0],
        form_method = document.getElementsByName ('_method')[0];

    if( toggle_public && hidden_published && form ) toggle_public.addEventListener('click', function() {
        //if( form[""] )
        hidden_published.value = true
        //form.submit()
    })

    if( toggle_private && hidden_published && form ) toggle_private.addEventListener('click', function() {
        hidden_published.value = false
        //form.submit()
    })
})