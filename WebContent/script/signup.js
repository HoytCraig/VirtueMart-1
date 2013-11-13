
function isAlpha(xStr){
               var s=/^[a-zA-Z]$/;
               return xStr.match(s);
              }
              function validate(){
                try{
                var f1=0; 
                var f2=0; 
                var f3=0; 
                var fa,fb,fc=0;
                var f4=0;

                var pass="",email="";

                var i=0,j=0,k=0,d1=0,d2=0,count1=0,count2=0,count3=0;
                
                email=document.signup.email.value;

                try{
                if(document.signup.name.value==""){
                    document.getElementById("nameMsg").innerHTML=("* enter the name");
                     fa=1;
                }
                else{
                     document.getElementById("nameMsg").innerHTML=("");
                     fa=0;
                }
                 }catch(abc){alert(abc.message+"name");}

                try{
                 if(document.signup.address.value==""){
                    document.getElementById("addMsg").innerHTML=("* enter the address");
                     fb=1;
                }
                 else{
                      document.getElementById("addMsg").innerHTML=("");
                     fb=0;
                 }
                 }catch(abc){alert(abc.message+"add");}
                   try{
                 var con=document.signup.number.value;
                 if(con==""){
                    document.getElementById("conMsg").innerHTML=("* enter the contact no.");
                     fc=1;
                }
                else{
                   j=0;
                    for(i=0;i<con.length;i++)
                     {  if(!isNaN(con.charAt(i)))
                         j++;
                     }
                    
                     if(j!=con.length){
                          document.getElementById("conMsg").innerHTML=("* enter a valid contact no.");
                     fc=1;
                     }
                     else{
                          document.getElementById("conMsg").innerHTML=("");
                         fc=0;
                     }

                }
                  }catch(err){alert(err.message);}
                try{
                if(email=="")
                    {document.getElementById("emailMsg").innerHTML=("* enter the email-id");
                         f1=1;
                    }
                else{ 
                        j=0, d1=0,d2=0,count1=0,count2=0,count3=0;
                        for(i=0;i<email.length;i++)
                        {
                            if(email.charAt(i)=='@')
                                {j=i;
                                 count1++;
                        }
                        }
                        if(count1<2){
                            for(i=0;i<email.length;i++)
                            {if(email.charAt(i)=='.')
                                   {if(i<j)
                                        {d1=i;
                                         count2++;
                                        }
                                        else
                                            {
                                              d2=i;
                                              count3++;
                                            }
                                   }      
                            }
                        }
                        if((count1!=1)||(count2!=1)||(count3!=1)||(j==0)||(d1==0)||(d1==0)||(d1==j-1)||(d2==j+1)){
                             document.getElementById("emailMsg").innerHTML=("* invalid email-id");
                             document.signup.email.value="";
                             f1=1;
                        }
                        else{
                    document.getElementById("emailMsg").innerHTML=("");
                     f1=0; 
                        }
                }
                }catch(abc){alert(abc.message+"email");}


                try{
                 pass=document.signup.pwd.value;
                  if(pass=="")
                {document.getElementById("passMsg").innerHTML=("* enter the password");
                     f3=1; 
                }
                else{
                    if(pass.length<8)
                    {
                         document.getElementById("passMsg").innerHTML=("* password less than 8 characters");
                         f3=1; 
                         
                    }
                    else{
                    try
                    {j=0;
                    k=0;
                    for(i=0;i<pass.length;i++){
                        if(isAlpha(pass.charAt(i))) j++;
                        else if(isNaN(pass.charAt(i))) k++;
                        }
                    if(j==pass.length)
                        {
                         document.getElementById("passMsg").innerHTML=(" * password contains only alphabets");
                         f3=1; 
                         
                        }
                     else if(k==0) {
                         document.getElementById("passMsg").innerHTML=(" * password contains no special characters");
                         f3=1; 
                         
                        }
                     else if(j+k==pass.length) {
                         document.getElementById("passMsg").innerHTML=(" * password contains no numbers");
                         f3=1; 
                         
                        }   
                        if(f3!=1)
                        {document.getElementById("passMsg").innerHTML=("");
                         f3=0;
                        } 
              
                    }
                     catch(o){alert(o.message);}
                }
                }
                 }catch(abc){alert(abc.message+"pass");}

                 try{
                   if(document.signup.cpwd.value=="")
                {document.getElementById("cpassMsg").innerHTML=("* confirm the password");
                     f4=1; 
                }
                else if(document.signup.cpwd.value!=document.signup.pwd.value)
                {document.getElementById("cpassMsg").innerHTML=("* passwords do not match, enter again");
                  f4=1;
                }

                else{document.getElementById("cpassMsg").innerHTML=("");
                     f4=0;}
                 } catch(abc){alert(abc.message+"cpass");}
                if((f3==0)&&(f4==1)){
                    document.getElementById("passMsg").innerHTML=(" * re-enter and confirm the password");
                }
                }catch(x){alert(x.message);}
               
                if((f1==0)&&(f2==0)&&(f3==0)&&(f4==0)&&(fa==0)&&(fb==0)&&(fc==0)){
                   
                    document.signup.submit();
                    return true;
                }else
                    {document.signup.pwd.value="";
                 document.signup.cpwd.value="";
                 return false;
                    }
                
                }

