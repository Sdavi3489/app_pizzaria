const express = require('express')
const app = express()
const cors = require('cors');
const bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(cors());

app.use(express.json())

app.get('/',(req,res)=>{
    return res.json(
    [
        {
            id: 1,
            nome: "Pizza de Calabresa",
            descricao: "Calabresa, Cebola, Azeitona Preta, Azeite de Oliva, Orégano",
            foto: "https://i0.wp.com/www.multarte.com.br/wp-content/uploads/2019/03/pizza-fundo-transparente-calabresa.png?resize=696%2C619&ssl=1",
            valor: 30.00
        },
        {
            id: 2,
            nome: "Pizza Portuguesa",
            descricao: "Queijo, Presunto, Tomate, Ovo, Orégano, Azeitona",
            foto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO0ZNW6K4ZOU-T-d6iCH7ZvBLycLklXQ4qfA&usqp=CAU",
            valor: 45.00
        },
        {
            id: 3,
            nome: "Pizza Mussarela",
            descricao: "Mussarela, Tomate, Orégano, Azeitona",
            foto: "https://i1.wp.com/www.multarte.com.br/wp-content/uploads/2019/03/pizza-png7.png?fit=696%2C351&ssl=1",
            valor: 25.00
        },
        {
            id: 4,
            nome: "Pizza Napolitana",
            descricao: "Mussarela, Azeitona, Anchovas em Azeite, Molho de Tomate",
            foto: "https://cdn.pixabay.com/photo/2014/06/30/20/53/pizza-380773_960_720.jpg",
            valor: 30.00
        },
        {
            id: 5,
            nome: "Pizza de Frango com Catupiry",
            descricao: "Frango, Catupiry, Azeitona, Orégano",
            foto: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJFDNA8_3mTpfpLDqV28Yzt7wzNwKUmb506w&usqp=CAU",
            valor: 20.00
        },
        {
            id: 6,
            nome: "Pizza de Chocolate com Banana",
            descricao: "Banana, Chocolate, Leite Condensado",
            foto: "https://image.shutterstock.com/image-photo/pizza-chocolate-bananas-260nw-1925441711.jpg",
            valor: 50.00
        },
    ]
    )
})

app.post('/comprar/:id', (req, res) => {
    console.log(req.body);
    return res.json(
    {
        mensagem: 'Compra adicionada ao carrinho com sucesso',
        dados:{
            id: req.params.id,
        }
    }
);
});


app.listen(
    8080,
    function () {
        console.log('Inicialização OK')
    }
);
