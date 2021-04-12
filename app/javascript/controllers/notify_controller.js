// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "user" ]

  connect () {
    document.addEventListener('notify', this.notify)
  }
  
  disconnect () {
    document.removeEventListener('notify', this.notify)
  }
  
  notify = event => {
    const { id, title, content, fromName, fromId, users, isMatch } = event.detail
    const currentUser = Number($(".notifs").attr('data-user'))
    let notifType = "reply"
    let route = "posts"
    let icon = "comments"
    if (users.includes(currentUser) && currentUser != fromId) {
      if (isMatch) {
         notifType = "message"
         route = "matches"
         icon = "handshake-o"
      }
      $(".notifs").append(`
      <div role="alert" aria-live="assertive" aria-atomic="true" class="toast ml-auto mb-4" data-autohide="false">
        <div class="toast-header">
          <strong class="mr-auto"><i class="fa fa-${icon}"></i> New ${notifType}</strong>
          <small>${new Date().toLocaleTimeString()}</small>
          <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="toast-body">
          <p>New ${notifType} from <strong>${fromName}</strong> on <strong>${title}</strong>:</p>
          <p>${content}</p>
          <a href="/${route}/${id}"><i class="fa fa-arrow-circle-right"></i> Go</a>
        </div>
      </div>
      `)
      $('.toast').toast({ autohide: false })
      $('.toast').toast('show')
    }
  }
}
