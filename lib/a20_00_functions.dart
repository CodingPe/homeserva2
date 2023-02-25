import 'package:flutter/material.dart';
import 'package:homeserva_2/a20_01_suggestions.dart';

class Functions extends StatelessWidget {
  const Functions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Functions"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/visitors.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/facility bookings.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/complaints.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // 在跳轉之前先返回上一頁
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const suggestions()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/suggestions.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/management account.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/meeting minutes.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/useful contacts.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/emergency sos.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/access%20card.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/home services applications.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/marketplace.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/concierge services.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/tukangman.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/laundry.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/qr keys.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/tenant accounts.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/committee.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ClipRRect( // 使用ClipRRect widget裁剪圖像以符合Container的邊框
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/icons/delivery lockers.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.cover, // 使用BoxFit.cover調整圖像大小以填滿容器
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
