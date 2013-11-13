function checkSearch(){
   if((document.searchBar.searchItem.value=="search")){

       document.getElementById("msg").innerHTML="Please enter search parameters";
       return false;
   }
   else{
     
      document.getElementById("msg").innerHTML="";
      return true;
}
}
function goNewWin() {

//***Get what is below onto one line***

window.open("updateCart.jsp",'TheNewpop','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1'); 

//***Get what is above onto one line*** 

self.close();

}
function cartUpdate(size,qty){
   
    var newSize=parseInt(size,10)+parseInt(qty,10);
    document.getElementById("cButton").value="Cart("+newSize+")";
    return true;
    }
   
function formCheck(){
try{alert("enter");   
var qty="";
qty=document.addForm.q.value;
alert("q="+qty);
}catch(err){alert(err.message);}
var flag=0;
if(qty==""){
    document.getElementById("error").innerHTML="* enter the quantity";
    flag=0;
}
else{
    var i,c=0;
    for( i=0;i<qty.length;i++){
    if(!isNaN(qty.charAt(i))) 
        c++;
    }
    if(c!=qty.length){
        document.getElementById("error").innerHTML="* enter a numerical value";
        flag=0;
    }
    else if(c<=0){
        document.getElementById("error").innerHTML="* enter a value greater than 0";
        flag=0;
      
}
else flag=1;
}

if(flag==1){
    document.getElementById("error").innerHTML="";
    return true;
}
else return false;
}
