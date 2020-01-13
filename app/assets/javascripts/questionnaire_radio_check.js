$(document).on("turbolinks:load", function () {
  $("input[type='radio']").on("change", function () {

      var questionnaire = '';
      var elemento01 = document.getElementsByClassName('questionnaire01');
      var elemento02 = document.getElementsByClassName('questionnaire02');
      var elemento03 = document.getElementsByClassName('questionnaire03');
      var elemento04 = document.getElementsByClassName('questionnaire04');
      var elemento05 = document.getElementsByClassName('questionnaire05');
      var elemento06 = document.getElementsByClassName('questionnaire06');
      var elemento07 = document.getElementsByClassName('questionnaire07');
      var elemento08 = document.getElementsByClassName('questionnaire08');
      var elemento09 = document.getElementsByClassName('questionnaire09');
      var elemento10 = document.getElementsByClassName('questionnaire10');

      check(elemento01, questionnaire);
      check(elemento02, questionnaire);
      check(elemento03, questionnaire);
      check(elemento04, questionnaire);
      check(elemento05, questionnaire);
      check(elemento06, questionnaire);
      check(elemento07, questionnaire);
      check(elemento08, questionnaire);
      check(elemento09, questionnaire);
      check(elemento10, questionnaire);
  })

  function check(elemento, questionnaire) {
    clear_alter(elemento);
    check_replicated(elemento, questionnaire);
  }

  function clear_alter(elemento) {
    for (i = 0; i < elemento.length; i++) {
      if (elemento[i].parentElement.className.includes("radio-error")) {
        elemento[i].parentElement.className = elemento[i].parentElement.className.replace(/radio-error/g, '');
      }
    }
  }

  function check_replicated(elemento, questionnaire) {
    for (i = 0; i < elemento.length; i++) {
      if (elemento[i].checked) {
        if (questionnaire.includes(elemento[i].value)) {
          elemento[i].parentElement.className += " radio-error";
        }
        questionnaire += elemento[i].value + ",";
      }
    }
  }
})