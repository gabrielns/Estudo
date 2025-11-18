document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('registrationForm');
  if(!form) return;

  const alertBox = document.getElementById('form-alert');

  function showAlert(message, type = 'error'){
    if(!alertBox) return;
    alertBox.textContent = message;
    alertBox.className = 'alert ' + (type === 'success' ? 'alert--success' : (type === 'info' ? 'alert--info' : 'alert--error'));
    alertBox.style.display = 'block';
    setTimeout(()=>{ alertBox.style.display = 'none'; }, 6000);
  }

  function setError(input, message){
    input.classList.add('input-error');
    let small = input.nextElementSibling;
    if(!small || !small.classList || !small.classList.contains('error-text')){
      small = document.createElement('small');
      small.className = 'error-text';
      input.parentNode.insertBefore(small, input.nextSibling);
    }
    small.textContent = message;
  }

  function clearError(input){
    input.classList.remove('input-error');
    let small = input.nextElementSibling;
    if(small && small.classList && small.classList.contains('error-text')){
      small.textContent = '';
    }
  }

  function isAdult(dateString){
    if(!dateString) return false;
    const today = new Date();
    const birth = new Date(dateString);
    if(isNaN(birth)) return false;
    const age = today.getFullYear() - birth.getFullYear();
    const m = today.getMonth() - birth.getMonth();
    if(m < 0 || (m === 0 && today.getDate() < birth.getDate())){
      return age - 1 >= 18;
    }
    return age >= 18;
  }
  function validateCPF(cpf){
    if(!cpf) return false;
    cpf = cpf.replace(/[\D]/g,'');
    if(cpf.length !== 11) return false;
    if(/^([0-9])\1+$/.test(cpf)) return false;
    const calc = (t) => {
      let sum = 0;
      for(let i=0;i<t;i++) sum += parseInt(cpf.charAt(i)) * (t+1-i);
      let res = (sum * 10) % 11;
      return res === 10 ? 0 : res;
    }
    return calc(9) === parseInt(cpf.charAt(9)) && calc(10) === parseInt(cpf.charAt(10));
  }

  function validatePhone(value){
    if(!value) return false;
    const v = value.replace(/[\s()-]/g,'');
    return /^\d{10,11}$/.test(v);
  }

  function validateCEP(cep){
    if(!cep) return false;
    return /^\d{5}-?\d{3}$/.test(cep);
  }

  function validateEmail(value){
    if(!value) return false;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  }

  const fields = {
    nome: {check: v => v && v.trim().length >= 5, message: 'Nome deve ter ao menos 5 caracteres.'},
    email: {check: validateEmail, message: 'E-mail inválido.'},
    cpf: {check: validateCPF, message: 'CPF inválido.'},
    telefone: {check: validatePhone, message: 'Telefone inválido.'},
    nascimento: {check: isAdult, message: 'Você deve ser maior de 18 anos.'},
    cep: {check: validateCEP, message: 'CEP inválido.'},
  };

  Object.keys(fields).forEach(name => {
    const el = form.querySelector('[name="'+name+'"]');
    if(!el) return;
    el.addEventListener('input', ()=>{
      const ok = fields[name].check(el.value);
      if(!ok) setError(el, fields[name].message); else clearError(el);
    });
  });

  form.addEventListener('submit', (e)=>{
    e.preventDefault();
    let hasError = false;
    Array.from(form.elements).forEach(el => {
      if(!el.name) return;
      clearError(el);
      if(el.required && !el.value){
        setError(el, 'Campo obrigatório.'); hasError = true; return;
      }
    });

    for(const name of Object.keys(fields)){
      const el = form.querySelector('[name="'+name+'"]');
      if(!el) continue;
      const ok = fields[name].check(el.value);
      if(!ok){ setError(el, fields[name].message); hasError = true; }
    }

    if(hasError){
      showAlert('Por favor, corrija os campos em destaque e tente novamente.');
      return false;
    }
    showAlert('Formulário válido! Submissão simulada.', 'success');
   
    return true;
  });
});
