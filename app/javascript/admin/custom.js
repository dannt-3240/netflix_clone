document.addEventListener('click', function(event) {
  if (event.target.id === 'sub-field') {
    var field = event.target.getAttribute('data-field');
    var new_id = new Date().getTime();
    var subTvSeriesContainer = document.querySelector('.tv_episodes');
    subTvSeriesContainer.insertAdjacentHTML('beforeend', field.replace(/hello/g, new_id));
  }
});

document.addEventListener('click', function(event) {
  if (event.target.classList.contains('remove-btn')) {
    event.target.parentNode.remove();
  }
});
