window.addEventListener("load",function(){
  function eventClick(){
    const XHR = new XMLHttpRequest()
    XHR.open("GET", `/users/check`, true)
    XHR.responseType = "json"
    XHR.setRequestHeader("Accept", "text/html")
    XHR.send()
    XHR.onload = function() {
      const res = XHR.response
      if (res.check === true) {
        var image = "/assets/profile.png"
      } else {
        var image = "/assets/member_photo_noimage_thumb-224a733c50d48aba6d9fdaded809788bbeb5ea5f6d6b8368adaebb95e58bcf53.png"
      }
      profile[0].innerHTML = `<img src="${image}"></img>`
      profile[0].firstElementChild.addEventListener('click',eventClick)
    }
  }
  let profile = document.getElementsByClassName("profile__image")
  profile[0].firstElementChild.addEventListener('click',eventClick)
})