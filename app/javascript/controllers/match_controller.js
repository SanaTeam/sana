import ApplicationController from './application_controller.js'

export default class extends ApplicationController {
  static targets = []

  connect () {
    super.connect()
    
    let hammer = new Hammer(document.getElementById('match'), {domEvents: true});

    const animateCSS = (element, animation, prefix = 'animate__') =>
  
      new Promise((resolve, reject) => {
      const animationName = `${prefix}${animation}`;
      const node = document.querySelector(element);

      node.classList.add(`${prefix}animated`, animationName);

      function handleAnimationEnd(event) {
        event.stopPropagation();
        node.classList.remove(`${prefix}animated`, animationName);
        resolve('Animation ended');
        document.getElementById('match').classList.remove("bg-danger");
        document.getElementById('match').classList.remove("bg-success");
        node.style.visibility = "hidden";
      }

      node.addEventListener('animationend', handleAnimationEnd, {once: true});
    
    });

    hammer.on("swipeleft swiperight", function(ev) {
      console.log(ev)
      if (ev.type == "swipeleft") {
        document.getElementById('match').classList.add("bg-danger");
        animateCSS('#match', 'fadeOutLeft');
      }
      else {
        document.getElementById('match').classList.add("bg-success");
        animateCSS('#match', 'fadeOutRight');
      }
    });
  }
  
  swipe(action) {
    let postId = Number($("#match").attr('data-post-id'))
    let user1Id = Number($("#match").attr('data-user1-id'))
    let user2Id = Number($("#match").attr('data-user2-id'))
    this.stimulate("Match#" + action, postId, user1Id, user2Id)
  }

  swipeleft() {
    this.swipe("decline")
  }

  swiperight() {
    this.swipe("accept")
  }

  disconnect () {
  }
  
}
