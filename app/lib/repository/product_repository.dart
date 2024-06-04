
import 'package:app/model/product_model.dart';
import 'package:app/shared/api.dart';

import 'package:dio/dio.dart';

class ProductRepository {
  Future getProduct(accessToken) async {
    final response = await api.get("/product/",
        options: Options(headers: {"Authorization": 'Bearer $accessToken'}));
    List<Product> listProduct = [];

    for (int i = 0; i < response.data.length; i++) {
      listProduct.add(Product.fromMap(response.data[i]));
    }
    return listProduct;
  }
}






//       id: '002',
//       category: 'Lonk Necks',
//       name:  'Heineken LN',
//       description: 'o mais puro suco da sevada',
//       qtd: 26,
//       price: 8.61,
//       urlImage:
//           'https://supermercadobomdemais.com.br/wp-content/uploads/2020/05/Cerveja-Heineken-Puro-Malte-330ml.png'),
//   Product(
//       id: '003',
//       category: 'Lonk Necks',
//       name:  'Budwiser LN',
//       description: '',
//       qtd: 26,
//       price: 8.69,
//       urlImage:
//           'https://th.bing.com/th/id/OIP.acqPlgo5vKTiqGpJIS3QuwAAAA?rs=1&pid=ImgDetMain'),
//   Product(
//       id: '006',
//       category: 'Drinks',
//       name:  'Caipirinha',
//       description: 'Seguindo essa receita, você não vai mais errar na caipirinha. Nada de amargor, excesso de bagaço, açúcar sobrando no fundo. A boa caipirinha é equilibrada, fácil de beber.O principal é: corte o limão em fatias finas e macere levemente com o açúcar. Nada de esmagar demais, nem de bater na coqueteleira, por favor.QUER VARIAR O SABOR? Sim, caipirinha é o drinque de cachaça, limão e açúcar. Mas, atire a primeira pedra quem nunca quis dar uma variada no sabor: ● Caipirinha de caju ● Caipirinha de matcha ● E mais drinques com cachaça',
//       qtd: 26,
//       price: 5.69,
//       urlImage:
//           'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8a0b71a4-d6c1-4653-ad4b-b8e8473bcbf0/dc02j14-d3849a9d-2fc9-44bc-96a3-367aff1bd86d.png/v1/fill/w_1024,h_1525/caipirinha_png_made_in_picsart_by_hanjorafael_dc02j14-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTUyNSIsInBhdGgiOiJcL2ZcLzhhMGI3MWE0LWQ2YzEtNDY1My1hZDRiLWI4ZTg0NzNiY2JmMFwvZGMwMmoxNC1kMzg0OWE5ZC0yZmM5LTQ0YmMtOTZhMy0zNjdhZmYxYmQ4NmQucG5nIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.wPwWUolbb15Pp6xKGZAU27iD-2oGasmkCA2AwsB2Thg'),
//  
//   Product(
//       id: '008',
//       category: 'Vinhos',
//       name:  'Skol 600',
//       description: '',
//       qtd: 26,
//       price: 8.8,
//       urlImage:
//           'https://supermercadobomdemais.com.br/wp-content/uploads/2020/05/Cerveja-Heineken-Puro-Malte-330ml.png'),
//   Product(
//       id: '009',
//       category: 'Vinhos',
//       name:  'Skol 600',
//       description: '',
//       qtd: 26,
//       price: 8.15,
//       urlImage:
//           'https://supermercadobomdemais.com.br/wp-content/uploads/2020/05/Cerveja-Heineken-Puro-Malte-330ml.png'),
//   Product(
//       id: '010',
//       category: 'Vinhos',
//       name:  'teste qtd',
//       description: '',
//       qtd: 3,
//       price: 8.0,
//       urlImage:
//           'https://supermercadobomdemais.com.br/wp-content/uploads/2020/05/Cerveja-Heineken-Puro-Malte-330ml.png'),
// ];

