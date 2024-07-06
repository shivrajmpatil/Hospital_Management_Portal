function validSpe(s)
{
	var flag = false;
	var speElement;
	for(var i=0; i<s.length; i++)
	{
		var ascii = s.charCodeAt(i);
		if(!((ascii>=65 && ascii<=90) || (ascii>=97 && ascii<=122)  || ascii==32))
		{
			flag = true;
			break;
		}
	}
	if(flag)
	{
		speElement = document.getElementById("spe");
		speElement.style.border="solid 4px #EE4E4E";
	}
	else
	{
		speElement = document.getElementById("spe");
		speElement.style.border="solid 4px #40A578";
	}
}

