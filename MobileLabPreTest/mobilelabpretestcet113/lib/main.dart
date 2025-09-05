// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RMUTR Activities',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'NotoSansThai',
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Activity {
  String id;
  String title;
  String description;
  String imageUrl;
  String organizer;
  DateTime date;
  TimeOfDay time;
  String location;
  String category;

  Activity({
    String? id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.organizer,
    required this.date,
    required this.time,
    required this.location,
    required this.category,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int currentIndex = 0;
  List<String> categories = ['ทั้งหมด', 'วิชาการ', 'ศิลปะ', 'กีฬา', 'สังคม'];
  List<Activity> allActivities = [
    Activity(
      title: 'สัมมนา AI เพื่อการศึกษา',
      description: 'เรียนรู้การประยุกต์ใช้ AI ในการพัฒนาการเรียนการสอน เพื่อยกระดับคุณภาพการศึกษาในศตวรรษที่ 21 พร้อมด้วยการสาธิตเครื่องมือ AI ที่ทันสมัย และการแลกเปลี่ยนประสบการณ์จากผู้เชี่ยวชาญด้าน AI Education',
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=200&fit=crop',
      organizer: 'คณะวิศวกรรมศาสตร์',
      date: DateTime(2567, 9, 20),
      time: TimeOfDay(hour: 9, minute: 0),
      location: 'หอประชุมใหญ่ มจธ. ธัญบุรี',
      category: 'วิชาการ',
    ),
    Activity(
      title: 'แข่งขันฟุตบอลสีจอมความสัมพันธ์',
      description: 'การแข่งขันกีฬาประจำปีของมหาวิทยาลัย เพื่อสร้างความสามัคคีและกีฬาดีเศรษฐ์ดี ระหว่างนักศึกษาทุกคณะ พร้อมกิจกรรมเชียร์และของรางวัลมากมาย รวมถึงการแข่งขันรอบชิงชนะเลิศที่จะจัดขึ้นในสนามหลัก',
      imageUrl: 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=400&h=200&fit=crop',
      organizer: 'กองพัฒนานักศึกษา',
      date: DateTime(2567, 9, 25),
      time: TimeOfDay(hour: 14, minute: 0),
      location: 'สนามกีฬากลาง มจธ. ธัญบุรี',
      category: 'กีฬา',
    ),
    Activity(
      title: 'นิทรรศการศิลปะนักศึกษา "สีสันแห่งความคิด"',
      description: 'การแสดงผลงานศิลปะจากนักศึกษาทุกคณะ ที่จะมาร่วมแสดงผลงานสร้างสรรค์ในรูปแบบต่างๆ ไม่ว่าจะเป็น จิตรกรรม ประติมากรรม การออกแบบกราฟิก และสื่อผสม เพื่อแสดงถึงความคิดสร้างสรรค์และศักยภาพของเยาวชนไทย',
      imageUrl: 'https://images.unsplash.com/photo-1541961017774-22349e4a1262?w=400&h=200&fit=crop',
      organizer: 'คณะศิลปกรรมศาสตร์',
      date: DateTime(2567, 10, 1),
      time: TimeOfDay(hour: 10, minute: 0),
      location: 'หอศิลป์ มจธ. ธัญบุรี',
      category: 'ศิลปะ',
    ),
    Activity(
      title: 'กิจกรรมอาสาพัฒนาชุมชน "น้อมใจรักษ์แผ่นดิน"',
      description: 'ร่วมพัฒนาชุมชนท้องถิ่นและสร้างสรรค์สังคม โดยการปลูกป่าชายเลน ทำความสะอาดสิ่งแวดล้อม และให้ความรู้แก่เด็กและเยาวชนในชุมชน เพื่อสร้างจิตสำนึกในการอนุรักษ์ธรรมชาติและสิ่งแวดล้อมอย่างยั่งยืน',
      imageUrl: 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?w=400&h=200&fit=crop',
      organizer: 'สโมสรนักศึกษา',
      date: DateTime(2567, 10, 5),
      time: TimeOfDay(hour: 8, minute: 0),
      location: 'ชุมชนบ้านสวน จ.ปทุมธานี',
      category: 'สังคม',
    ),
  ];

  List<Activity> get filteredActivities {
    if (currentIndex == 0) return allActivities;
    String selectedCategory = categories[currentIndex];
    return allActivities.where((activity) => activity.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4E9F),
        title: Text(
          'RMUTR Activities',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Navigation Bar
          Container(
            color: Color(0xFF8B4E9F),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.apps, 'กิจกรรม', 0),
                _buildNavItem(Icons.school, 'วิชาการ', 1),
                _buildNavItem(Icons.palette, 'ศิลปะ', 2),
                _buildNavItem(Icons.sports_soccer, 'กีฬา', 3),
                _buildNavItem(Icons.people, 'สังคม', 4),
              ],
            ),
          ),
          // Activities List
          Expanded(
            child: filteredActivities.isEmpty 
                ? _buildEmptyState() 
                : ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: filteredActivities.length,
                    itemBuilder: (context, index) {
                      final activity = filteredActivities[index];
                      return _buildActivityCard(activity, index);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: _buildAnimatedFAB(),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.all(isActive ? 8 : 6),
              decoration: BoxDecoration(
                color: isActive ? Colors.white.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isActive ? Colors.white : Colors.white70,
                size: isActive ? 28 : 24,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white70,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isActive)
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.only(top: 2),
                height: 3,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 800),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: Icon(
                  Icons.event_busy,
                  size: 80,
                  color: Colors.grey[400],
                ),
              );
            },
          ),
          SizedBox(height: 16),
          Text(
            'ยังไม่มีกิจกรรมในหมวดนี้',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'กดปุ่ม + เพื่อเพิ่มกิจกรรมใหม่',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(Activity activity, int index) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300 + (index * 100)),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: _buildHoverableCard(activity),
          ),
        );
      },
    );
  }

  Widget _buildHoverableCard(Activity activity) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          shadowColor: Colors.black26,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _openDetailView(activity),
            onLongPress: () => _showActivityOptions(activity),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Image with Category Badge
                  Stack(
                    children: [
                      Hero(
                        tag: 'activity-${activity.id}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            activity.imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.grey[300]!, Colors.grey[100]!],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image, size: 50, color: Colors.grey),
                                      SizedBox(height: 8),
                                      Text('ไม่สามารถโหลดรูปได้', 
                                        style: TextStyle(color: Colors.grey[600])),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Category Badge
                      Positioned(
                        top: 12,
                        right: 12,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color(0xFF8B4E9F),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            activity.category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Read More Overlay
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'อ่านเพิ่มเติม',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Card Content
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          activity.description.length > 100 
                              ? '${activity.description.substring(0, 100)}...' 
                              : activity.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 16),
                        // Info Row
                        Row(
                          children: [
                            Icon(Icons.group, size: 18, color: Color(0xFF8B4E9F)),
                            SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                activity.organizer,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8B4E9F),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 6),
                            Text(
                              '${activity.date.day} ${_getThaiMonth(activity.date.month)} ${activity.date.year}',
                              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 6),
                            Text(
                              activity.time.format(context),
                              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        if (activity.location.isNotEmpty) ...[
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  activity.location,
                                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedFAB() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: FloatingActionButton.extended(
        onPressed: () => _navigateToAddActivity(),
        backgroundColor: Color(0xFF8B4E9F),
        elevation: 8,
        icon: Icon(Icons.add, color: Colors.white),
        label: Text(
          'เพิ่มกิจกรรม',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Activity Detail View
  void _openDetailView(Activity activity) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return ActivityDetailScreen(
            activity: activity,
            onEdit: () => _navigateToEditActivity(activity),
            onDelete: () => _confirmDeleteActivity(activity),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 0.1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 400),
      ),
    );
  }

  String _getThaiMonth(int month) {
    const months = [
      '', 'ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.',
      'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'
    ];
    return months[month];
  }

  void _showActivityOptions(Activity activity) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 16),
              Text(
                activity.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionButton(
                    icon: Icons.visibility,
                    label: 'ดูรายละเอียด',
                    onTap: () {
                      Navigator.pop(context);
                      _openDetailView(activity);
                    },
                  ),
                  _buildOptionButton(
                    icon: Icons.edit,
                    label: 'แก้ไข',
                    onTap: () {
                      Navigator.pop(context);
                      _navigateToEditActivity(activity);
                    },
                  ),
                  _buildOptionButton(
                    icon: Icons.delete,
                    label: 'ลบ',
                    color: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      _confirmDeleteActivity(activity);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    final buttonColor = color ?? Color(0xFF8B4E9F);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: buttonColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: buttonColor.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: buttonColor, size: 28),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: buttonColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddActivity() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditActivityScreen(
          onSave: (activity) {
            setState(() {
              allActivities.add(activity);
            });
          },
          categories: categories.skip(1).toList(),
        ),
      ),
    );
  }

  void _navigateToEditActivity(Activity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditActivityScreen(
          activity: activity,
          onSave: (updatedActivity) {
            setState(() {
              int index = allActivities.indexWhere((a) => a.id == activity.id);
              if (index != -1) {
                allActivities[index] = updatedActivity;
              }
            });
          },
          categories: categories.skip(1).toList(),
        ),
      ),
    );
  }

  void _confirmDeleteActivity(Activity activity) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 8),
              Text('ยืนยันการลบ'),
            ],
          ),
          content: Text('คุณต้องการลบกิจกรรม "${activity.title}" หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('ยกเลิก'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  allActivities.removeWhere((a) => a.id == activity.id);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('ลบกิจกรรมเรียบร้อยแล้ว'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('ลบ', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

// ============================================================================
// ACTIVITY DETAIL SCREEN - Full Screen View
// ============================================================================

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  ActivityDetailScreen({
    required this.activity,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Hero Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Color(0xFF8B4E9F),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onSelected: (value) {
                  switch (value) {
                    case 'edit':
                      Navigator.pop(context);
                      onEdit();
                      break;
                    case 'delete':
                      Navigator.pop(context);
                      onDelete();
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Color(0xFF8B4E9F)),
                        SizedBox(width: 8),
                        Text('แก้ไข'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8),
                        Text('ลบ'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'activity-${activity.id}',
                    child: Image.network(
                      activity.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF8B4E9F), Color(0xFFB8A9C9)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.image,
                              size: 80,
                              color: Colors.white54,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                  // Category Badge
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        activity.category,
                        style: TextStyle(
                          color: Color(0xFF8B4E9F),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      activity.title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Info Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.group,
                            title: 'ผู้จัดกิจกรรม',
                            content: activity.organizer,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.location_on,
                            title: 'สถานที่',
                            content: activity.location.isNotEmpty ? activity.location : 'ไม่ระบุ',
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 12),
                    
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.calendar_today,
                            title: 'วันที่',
                            content: '${activity.date.day} ${_getThaiMonth(activity.date.month)} ${activity.date.year}',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.access_time,
                            title: 'เวลา',
                            content: activity.time.format(context),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Description Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.description,
                                color: Color(0xFF8B4E9F),
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'รายละเอียด',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            activity.description,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              onEdit();
                            },
                            icon: Icon(Icons.edit, color: Colors.white),
                            label: Text(
                              'แก้ไขกิจกรรม',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8B4E9F),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onDelete();
                          },
                          icon: Icon(Icons.delete, color: Colors.white),
                          label: Text(
                            'ลบ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF8B4E9F).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF8B4E9F).withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: Color(0xFF8B4E9F),
              ),
              SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _getThaiMonth(int month) {
    const months = [
      '', 'ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.',
      'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'
    ];
    return months[month];
  }
}

// ============================================================================
// ADD/EDIT ACTIVITY SCREEN
// ============================================================================

class AddEditActivityScreen extends StatefulWidget {
  final Activity? activity;
  final Function(Activity) onSave;
  final List<String> categories;

  AddEditActivityScreen({
    this.activity,
    required this.onSave,
    required this.categories,
  });

  @override
  _AddEditActivityScreenState createState() => _AddEditActivityScreenState();
}

class _AddEditActivityScreenState extends State<AddEditActivityScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  late TextEditingController _organizerController;
  late TextEditingController _locationController;
  
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    
    final activity = widget.activity;
    _titleController = TextEditingController(text: activity?.title ?? '');
    _descriptionController = TextEditingController(text: activity?.description ?? '');
    _imageUrlController = TextEditingController(text: activity?.imageUrl ?? '');
    _organizerController = TextEditingController(text: activity?.organizer ?? '');
    _locationController = TextEditingController(text: activity?.location ?? '');
    
    _selectedDate = activity?.date ?? DateTime.now();
    _selectedTime = activity?.time ?? TimeOfDay.now();
    _selectedCategory = activity?.category ?? widget.categories.first;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _organizerController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.activity != null;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4E9F),
        title: Text(
          isEditing ? 'แก้ไขกิจกรรม' : 'เพิ่มกิจกรรมใหม่',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            // Header Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      isEditing ? Icons.edit : Icons.add_circle_outline,
                      size: 48,
                      color: Color(0xFF8B4E9F),
                    ),
                    SizedBox(height: 12),
                    Text(
                      isEditing ? 'แก้ไขข้อมูลกิจกรรม' : 'สร้างกิจกรรมใหม่',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'กรอกข้อมูลให้ครบถ้วนเพื่อสร้างกิจกรรมที่น่าสนใจ',
                      style: TextStyle(color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // Form Fields
            _buildFormCard([
              _buildTextField(
                controller: _titleController,
                label: 'ชื่อกิจกรรม *',
                icon: Icons.title,
                validator: (value) => value?.isEmpty == true ? 'กรุณาใส่ชื่อกิจกรรม' : null,
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: _descriptionController,
                label: 'รายละเอียด *',
                icon: Icons.description,
                maxLines: 4,
                validator: (value) => value?.isEmpty == true ? 'กรุณาใส่รายละเอียด' : null,
              ),
            ]),
            
            SizedBox(height: 16),
            
            _buildFormCard([
              _buildTextField(
                controller: _imageUrlController,
                label: 'URL รูปภาพ',
                icon: Icons.image,
                hint: 'https://example.com/image.jpg',
              ),
              if (_imageUrlController.text.isNotEmpty) ...[
                SizedBox(height: 12),
                _buildImagePreview(),
              ],
            ]),
            
            SizedBox(height: 16),
            
            _buildFormCard([
              _buildTextField(
                controller: _organizerController,
                label: 'ผู้จัดกิจกรรม *',
                icon: Icons.group,
                validator: (value) => value?.isEmpty == true ? 'กรุณาใส่ชื่อผู้จัด' : null,
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: _locationController,
                label: 'สถานที่',
                icon: Icons.location_on,
              ),
            ]),
            
            SizedBox(height: 16),
            
            _buildFormCard([
              _buildCategoryDropdown(),
              SizedBox(height: 16),
              _buildDateTimePickers(),
            ]),
            
            SizedBox(height: 32),
            
            // Save Button
            Container(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _saveActivity,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B4E9F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                child: Text(
                  isEditing ? 'บันทึกการแก้ไข' : 'สร้างกิจกรรม',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFormCard(List<Widget> children) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      onChanged: (value) {
        if (controller == _imageUrlController) {
          setState(() {}); // Rebuild to show/hide image preview
        }
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Color(0xFF8B4E9F)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF8B4E9F), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          _imageUrlController.text,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.broken_image, color: Colors.grey[400], size: 32),
                    SizedBox(height: 4),
                    Text('ไม่สามารถโหลดรูปได้', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedCategory,
      decoration: InputDecoration(
        labelText: 'หมวดหมู่ *',
        prefixIcon: Icon(Icons.category, color: Color(0xFF8B4E9F)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF8B4E9F), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      items: widget.categories.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCategory = value!;
        });
      },
    );
  }

  Widget _buildDateTimePickers() {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.calendar_today, color: Color(0xFF8B4E9F)),
              title: Text('วันที่', style: TextStyle(fontSize: 14)),
              subtitle: Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: _selectDate,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.access_time, color: Color(0xFF8B4E9F)),
              title: Text('เวลา', style: TextStyle(fontSize: 14)),
              subtitle: Text(
                _selectedTime.format(context),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: _selectTime,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF8B4E9F),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF8B4E9F),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveActivity() {
    if (_formKey.currentState!.validate()) {
      final activity = Activity(
        id: widget.activity?.id,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        imageUrl: _imageUrlController.text.trim().isNotEmpty 
            ? _imageUrlController.text.trim()
            : 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=200&fit=crop',
        organizer: _organizerController.text.trim(),
        location: _locationController.text.trim(),
        date: _selectedDate,
        time: _selectedTime,
        category: _selectedCategory,
      );

      widget.onSave(activity);
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text(
                widget.activity != null ? 'แก้ไขกิจกรรมเรียบร้อยแล้ว' : 'สร้างกิจกรรมเรียบร้อยแล้ว',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(16),
          duration: Duration(seconds: 2),
        ),
      );
      
      Navigator.pop(context);
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 8),
              Text('กรุณากรอกข้อมูลที่จำเป็นให้ครบถ้วน'),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(16),
        ),
      );
    }
  }
}