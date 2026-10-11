import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  final TextEditingController nameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();

  final _formkey=GlobalKey<FormState>();

  final List <Map<String,String>> Contact=[
    {
      'name':'hasib',
      'phone':'01927273456'
    },
    {
      'name':'rakib',
      'phone':'01994374565'
    },
    {
      'name':'roni',
      'phone':'01920987690'
    },
    {
      'name':'tahmid',
      'phone':'019272867436'
    },
    {
      'name':'shaon',
      'phone':'01937583937'
    },
        {
      'name':'nafis',
      'phone':'01927279860'
    },
    {
      'name':'tasrif',
      'phone':'01994309841'
    },
    {
      'name':'sani',
      'phone':'01920987698'
    },
    {
      'name':'ridoy',
      'phone':'019272867490'
    },
    {
      'name':'shakil',
      'phone':'01935678348'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List',style: 
        TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          toolbarHeight: 70,
          toolbarOpacity: 0.8,
          elevation: 10,
          shadowColor: Colors.black,
          // leading: Text('Practice App'),
          // leadingWidth: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.white)
          ),
          backgroundColor: Colors.blueGrey.shade400,
          foregroundColor: Colors.white,
      ),

      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.numberWithOptions(),             
                autocorrect: false,
                autofocus: true,
                showCursor: true,
                cursorColor: Colors.red,
                cursorHeight: 20,
                cursorWidth: 3,
                cursorRadius: Radius.circular(20),
        
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'Please ente the value';
                  // }else if(!(value.startsWith('Md.') || value.startsWith('Mr.') || value.startsWith('Ms.') || value.startsWith('Mrs.') || value.startsWith('Miss.'))){
                  //   return 'Please enter the valid name';
                  }return null;
                },
             
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey,width: 1.5)
                  ),               
                  labelText: 'name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    backgroundColor: Colors.grey.shade300
                  ),
                   prefixIcon: Icon(Icons.person,size: 30,),
                   prefixIconColor: Colors.brown,
                  //  prefixText: 'name : ',
                  //  prefixStyle: TextStyle(
                  //   color: Colors.red,
                  //   backgroundColor: Colors.grey.shade200
                  //  ),
                ), 
              ),
              
              SizedBox(height: 10,),
        
               TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone, 
                obscureText: false,            
                autocorrect: false,
                autofocus: true,
                showCursor: true,
                cursorColor: Colors.red,
                cursorHeight: 20,
                cursorWidth: 3,
                cursorRadius: Radius.circular(20),
        
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'Please enter the value';
                  }else if(value.length !=11 || !value.startsWith('01')){
                    return 'Please enter the valid';
                  }else if(int.tryParse(value)==null){
                    return 'enter only number';
                  }return null;
                },
             
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey,width: 1.5)
                  ),               
                  labelText: 'phone',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    backgroundColor: Colors.grey.shade300
                  ),
                  prefixIcon: Icon(Icons.call,size: 30,),
                  prefixIconColor: Colors.brown,
                  // prefixText: 'phone : ',
                  // prefixStyle: TextStyle(
                  //   color: Colors.red,
                  //   backgroundColor: Colors.grey.shade200
                  // )
                ),  
                          
              ),
              SizedBox(height: 10,),
        
              SizedBox(
                height: 50,
                width: double.infinity.w,
                child: ElevatedButton.icon(onPressed: (){      
                  setState(() {
                    print(nameController.text);
                    print(phoneController.text);

                    if(_formkey.currentState!.validate()){

                    }                    
                  });
                }, label: Text('Add',style:
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),icon: Icon(Icons.add,size: 30,),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                    side: BorderSide(color: Colors.blueGrey)
                  ),
                  backgroundColor: Colors.blueGrey.shade500,
                  foregroundColor: Colors.white,
                  alignment: Alignment.center,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  overlayColor: Colors.grey,
                  padding: EdgeInsets.all(10),
                  splashFactory: InkSparkle.splashFactory,
                  surfaceTintColor: Colors.black //button er upor halka tint ba halka color add kore
                  
                ),),
              ),
              SizedBox(height: 30,),
              
              Expanded(
                flex: 70,
                child: ListView.builder(
                  itemCount: Contact.length,
                  itemBuilder: (context, index){
                    return Card(
                      color: Colors.grey.shade100,
                      child: ListTile(
                        title: Text(Contact[index]['name']!),
                        subtitle: Text(Contact[index]['phone']!),
                        leading: Icon(Icons.person,color: Colors.brown,size: 40,),
                        trailing: Icon(Icons.call,color: Colors.blue,size: 40,),
                      ),        
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}