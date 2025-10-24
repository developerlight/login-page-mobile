import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// profile_page is resolved via named routing in AppRouter; avoid direct import here to use central router

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  'John Doe Brown',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Icon(
                    Icons.search_outlined,
                    color: Colors.black87,
                    size: 30,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black87,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$12,345.67',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add Money',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.green, size: 30),
                        SizedBox(height: 8),
                        Text(
                          'Income',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$5,678.90',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.arrow_downward, color: Colors.red, size: 30),
                        SizedBox(height: 8),
                        Text(
                          'Expenses',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$3,210.45',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.blue,
                          size: 30,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Savings',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$1,234.56',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 440,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red[100],
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.red[900],
                            ),
                          ),
                          title: Text('Grocery Shopping'),
                          subtitle: Text('Aug 20, 2024'),
                          trailing: Text(
                            '-\$150.75',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green[100],
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.green,
                            ),
                          ),
                          title: Text('Salary'),
                          subtitle: Text('Aug 15, 2024'),
                          trailing: Text(
                            '+\$3,000.00',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            child: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text('Savings Deposit'),
                          subtitle: Text('Aug 10, 2024'),
                          trailing: Text(
                            '+\$500.00',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red[100],
                            child: Icon(
                              Icons.restaurant,
                              color: Colors.red[900],
                            ),
                          ),
                          title: Text('Restaurant'),
                          subtitle: Text('Aug 8, 2024'),
                          trailing: Text(
                            '-\$75.20',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green[100],
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.green,
                            ),
                          ),
                          title: Text('Freelance Project'),
                          subtitle: Text('Aug 5, 2024'),
                          trailing: Text(
                            '+\$800.00',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red[100],
                            child: Icon(
                              Icons.local_gas_station,
                              color: Colors.red[900],
                            ),
                          ),
                          title: Text('Gas Station'),
                          subtitle: Text('Aug 3, 2024'),
                          trailing: Text(
                            '-\$40.00',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            child: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text('Savings Withdrawal'),
                          subtitle: Text('Aug 1, 2024'),
                          trailing: Text(
                            '-\$200.00',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the main dashboard content. Navigation for tabs uses named routes
      // handled by the central AppRouter instead of a local List<Widget>.
      body: Dash(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.red[900]!,
        buttonBackgroundColor: Colors.red[700]!,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int tappedIndex) {
          // Map tab index to named routes defined in AppRouter
          switch (tappedIndex) {
            case 0:
              // Ensure we are on the dashboard route (replace stack)
              Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (r) => false);
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
            default:
              break;
          }
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
