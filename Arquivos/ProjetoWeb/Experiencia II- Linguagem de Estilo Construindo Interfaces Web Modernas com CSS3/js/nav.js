document.addEventListener('DOMContentLoaded', function(){
  const toggle = document.querySelector('.nav-toggle');
  if(!toggle) return;
  toggle.addEventListener('click', function(){
    document.body.classList.toggle('nav-open');
    toggle.setAttribute('aria-expanded', document.body.classList.contains('nav-open'));
  });

  // close on link click (mobile)
  document.querySelectorAll('.main-nav a').forEach(a=>{
    a.addEventListener('click', ()=>{
      if(document.body.classList.contains('nav-open')){
        document.body.classList.remove('nav-open');
      }
    })
  })
});
