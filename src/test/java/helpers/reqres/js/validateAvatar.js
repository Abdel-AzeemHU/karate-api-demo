function fn(id, url) {
    const regex = new RegExp(`^https:\/\/reqres\.in\/img\/faces\/${id}-image.*(\.jpg)$`)
    return regex.test(url)
}