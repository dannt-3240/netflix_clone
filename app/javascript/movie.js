const playButton = document.querySelector('.btn-play')
const playBackGround = document.querySelector('.player-bg')
const videoPlayer = document.getElementById('video-player')
const videoSource = document.getElementById('video-source')

playButton.addEventListener('click', () => {
  videoPlayer.style.display = 'block'
  videoPlayer.play()
  playButton.style.display = 'none'
  playBackGround.style.display = 'none'
})

document.addEventListener('DOMContentLoaded', function () {
  const ctsSwitchers = document.querySelectorAll('.cts-switcher')

  ctsSwitchers.forEach(function (switcher) {
    switcher.addEventListener('click', function () {
      const targetName = switcher
        .closest('.cts-block')
        .getAttribute('data-name')
      const shortBlock = document.querySelector('[data-name="short"]')
      const fullBlock = document.querySelector('[data-name="full"]')

      if (targetName === 'short') {
        shortBlock.style.display = 'none'
        fullBlock.style.display = 'block'
      } else if (targetName === 'full') {
        shortBlock.style.display = 'block'
        fullBlock.style.display = 'none'
      }
    })
  })
})
