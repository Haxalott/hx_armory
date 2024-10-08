function notify(title, description, type, icon)
    lib.notify({
        title = title,
        description = description,
        type = type,
        icon = icon,
        position = 'top-center'
    })
end