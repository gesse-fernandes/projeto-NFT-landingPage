let btn = document.querySelector('button');

btn.addEventListener('click',()=>{

    login();

})

async function login(){

if(window.ethereum){

        //Inicializar carteira.

        var web3 = new Web3(window.ethereum);

        try{

            const eth = window.ethereum;

            const accounts = await ethereum.request({method:'eth_requestAccounts'});

            const account = accounts[0];

            console.log(account);



            const sign = await ethereum.request({method:'personal_sign',params:['Mint no website https://dankicode.com',account]});

            //A partir daqui chamar contrato inteligente.

        }catch(e){}

    }else{

        alert('Instale sua carteira...');

    }

}