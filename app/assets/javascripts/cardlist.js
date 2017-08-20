/**
 * For handling:
 * - SponsorsList
 */

$(document).ready(function() {
  // Bind Events to Dom Elements

  Array.from(document.querySelectorAll('.SponsorTile')).forEach(function(elem) {
    var arrowEl = elem.querySelector('span[data-arrow]');
    var contentEl = elem.querySelector('div[data-content]');
    elem.addEventListener('click', function() {
      if (contentEl.classList.contains('sponsor-content-show')) {
        contentEl.classList.remove('sponsor-content-show');
        arrowEl.classList.remove('flip-up');
        arrowEl.classList.add('flip-down');
      } else {
        contentEl.classList.add('sponsor-content-show');
        arrowEl.classList.remove('flip-down');
        arrowEl.classList.add('flip-up');
      }
    });
  });
});
