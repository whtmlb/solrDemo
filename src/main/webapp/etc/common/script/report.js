/**
* ���ݣ�����ʹ�õ�JS(/ect/common/script/)
* ���ڣ�2010��12��23��
* created by fancy
*/
function gbrq(){//���ӱ������͵ĸı�
	var lx=document.all.bblx.value;
	//--------------------------------------------------
	var tjq=21;//�޸Ĵ˴������޸�Ĭ�ϵ�ͳ��������
	var tjz=20;//�޸Ĵ˴������޸�Ĭ�ϵ�ͳ������ֹ
	//--------------------------------------------------
	var jn=new Date().getYear();
	var qn=jn-1;
	if(lx=='99'){//Ĭ��
		document.all.clrqday.disabled="";
		document.all.clrqxy.disabled="";
		return true;
	}

	if(lx=='01'){//һ��
		document.all.clrqday.disabled="disabled";
		document.all.clrqxy.disabled="disabled";
		document.all.clrqday.value=qn+"-12-"+tjq;
		document.all.clrqxy.value=jn+"-01-"+tjz;
		return true;
	}
	if(lx<='12' && lx>'01'){//�±�
		var qz=lx-1;
		if(qz<10) qz="0"+qz;
		document.all.clrqday.disabled="disabled";
		document.all.clrqxy.disabled="disabled";
		document.all.clrqday.value=jn+"-"+qz+"-"+tjq;
		document.all.clrqxy.value=jn+"-"+lx+"-"+tjz;
		return true;
	}
	if(lx=='81'){//һ��
		document.all.clrqday.disabled="disabled";
		document.all.clrqxy.disabled="disabled";
		document.all.clrqday.value=qn+"-12-"+tjq;
		document.all.clrqxy.value=jn+"-03-"+tjz;
		return true;
	}
	if(lx>'81' && lx <'85' ){//��
		document.all.clrqday.disabled="disabled";
		document.all.clrqxy.disabled="disabled";
		if(lx=='82'){
		document.all.clrqday.value=jn+"-03-"+tjq;
		document.all.clrqxy.value=jn+"-06-"+tjz;
		}
		if(lx=='83'){
		document.all.clrqday.value=jn+"-06-"+tjq;
		document.all.clrqxy.value=jn+"-09-"+tjz;
		}
		if(lx=='84'){
		document.all.clrqday.value=jn+"-09-"+tjq;
		document.all.clrqxy.value=jn+"-12-"+tjz;
		}
		return true;
	}
	if(lx=='91'){
		document.all.clrqday.disabled="disabled";
		document.all.clrqxy.disabled="disabled";
		document.all.clrqday.value=qn+"-12-"+tjq;
		document.all.clrqxy.value=jn+"-06-"+tjz;
	}
	
	if(lx=='92'){
		document.all.clrqday.disabled="disabled";
		document.all.clrqxy.disabled="disabled";
		document.all.clrqday.value=jn+"-06-"+tjq;
		document.all.clrqxy.value=jn+"-12-"+tjz;
	}
	if(lx=='93'){
		document.all.clrqday.disabled="disabled";
		document.all.clrqxy.disabled="disabled";
		document.all.clrqday.value=qn+"-12-"+tjq;
		document.all.clrqxy.value=jn+"-12-"+tjz;
	}
}