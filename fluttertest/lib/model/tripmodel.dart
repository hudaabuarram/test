

class TripModel
{ String? id;
  String? type;
  String? face;
  String? name;
  String? fdate;
  String? ldate;
  String? price;
  String? days;
  String? discription;
  bool isbook=false;
  String? image;



  TripModel({
    this.id,
    this.type,
    this.face,
    this.fdate,
    this.ldate,
    this.name,
    this.price,
    this.days,
    this.discription,
    required this.isbook,
    this.image

  });

  TripModel.fromJson(Map<String, dynamic>? json){

    type = json!['type'];
    id = json['id'];
    face = json['face'];
    name = json['name'];
    fdate = json['fdate'];
    ldate = json['ldate'];
    price = json['price'];
    days = json['days'];
    discription = json['discription'];
    isbook = json['isbook'];
    image = json['image'];
  }

  Map<String, dynamic> toMap (){
    return {
      'id': id,
      'type': type,
      'face': face,
      'name':name,
      'fdate':fdate,
      'ldate':ldate,
      'price': price,
      'discription':discription,
      'days': days,
      'isbook': isbook,
      'image': image,
    };
  }


}
// List<TripModel>trips=[
//   TripModel(name:'Norge',face: 'Hemmmelig',days: '6',fdate: '6/6/2021',ldate: '15/6/2021',
//       discription:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, '
// 'and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
// ,isbook: false,price: 'NOK19990',type:'inner'),
//
//   TripModel(name:'Norge',face: 'Hemmmelig',days: '6',fdate: '6/6/2021',ldate: '15/6/2021',
//       discription:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, '
//           'and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
//       ,isbook: false,price: 'NOK19990',type:'inner'),
//   TripModel(name:'Norge',face: 'Hemmmelig',days: '6',fdate: '6/6/2021',ldate: '15/6/2021',
//       discription:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, '
//           'and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
//       ,isbook: false,price: 'NOK19990',type:'inner')
//
//
//
//
// ];