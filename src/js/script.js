const singin=document.getElementById('login'),
      singin2=document.getElementById('login2'),
      container=document.getElementById('container'),
      register=document.getElementById('register'),
      register2=document.getElementById('register2'),
      user_signup=document.getElementById('user_signup'),
      user_signin=document.getElementById('user_signin'),
      sign_in_pass=document.getElementById('sign-in-pass'),
      sign_in_email=document.getElementById('sign-in-email'),
      sign_up_pass=document.getElementById('sign-up-pass'),
      sign_up_name=document.getElementById('sign-up-name'),
      sign_up_email=document.getElementById('sign-up-email'),
      signup_error=document.getElementById('signup_error'),
      signin_error=document.getElementById('singin_error')
user_signin.addEventListener('click',()=>{
  console.log('click')
  if(sign_in_email.value.length>0 && sign_in_pass.value.length>0){
    let check=sign_in_email.value.split('@')
    if(check[1]==="gamil.com" ||check[1]==="outlook.com"){
      signin_error.style.color="green"
      signin_error.textContent="success"
    }
    else{
      signin_error.style.color="red"
      signin_error.textContent="Invalid Mail Address"
    }
  }
  else{
    signin_error.style.color="red"
    signin_error.textContent="Fill the Form"
  }
})
user_signup.addEventListener('click',()=>{
  console.log('click')
  if(sign_up_email.value.length>0 && sign_up_pass.value.length>0 && sign_up_name.value.length>0){
    let check=sign_up_email.value.split('@')
    if(check[1]==="gamil.com" ||check[1]==="outlook.com"){
     signup_error.style.color="green"
     signup_error.textContent="success"
    }
    else{
      signup_error.style.color="red"
      signup_error.textContent="Invalid Mail Address"
    }
  }
  else{
    signup_error.style.color="red"
    signup_error.textContent="Fill the Form"
  }
})
singin.addEventListener('click',()=>{
container.classList.remove('active')
})
singin2.addEventListener('click',()=>{
  container.classList.remove('active')
  })
  register2.addEventListener('click',()=>{
    container.classList.add('active')
  })
register.addEventListener('click',()=>{
  container.classList.add('active')
})