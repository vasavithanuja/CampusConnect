
import 'package:flutter/material.dart';

class BusTrackingScreen extends StatefulWidget {
  const BusTrackingScreen({super.key});

  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {
  String selectedStatus = 'All';
  String mapStyle = 'Simple';
  String searchText = '';
  bool showVehicleNumber = true;
  bool showTraffic = false;
  bool showGeofence = true;

  final List<Map<String, dynamic>> buses = [
    {
      'number': 'AP16TF5355',
      'route': 'Bhimavaram - Narayanapuram',
      'location': 'Kovvada, Andhra Pradesh 534206',
      'status': 'Stopped',
      'duration': '1 hour 27 minutes',
      'distance': '46.9 km',
      'lastSeen': '2 min ago',
      'ignition': false,
      'speed': 0,
      'voltage': '27.65 V',
      'driver': 'Ramesh',
    },
    {
      'number': 'AP16TF5356',
      'route': 'Bhimavaram - Palakollu',
      'location': 'Undi Road, Bhimavaram',
      'status': 'Moving',
      'duration': 'On trip',
      'distance': '32.4 km',
      'lastSeen': '10 sec ago',
      'ignition': true,
      'speed': 42,
      'voltage': '27.8 V',
      'driver': 'Suresh',
    },
    {
      'number': 'AP16TF5357',
      'route': 'College - Railway Station',
      'location': 'Bhimavaram Railway Station',
      'status': 'Idling',
      'duration': '8 minutes',
      'distance': '18.2 km',
      'lastSeen': '30 sec ago',
      'ignition': true,
      'speed': 0,
      'voltage': '27.5 V',
      'driver': 'Kiran',
    },
    {
      'number': 'AP16TF5358',
      'route': 'Bhimavaram - Tanuku',
      'location': 'Tanuku Main Road',
      'status': 'Moving',
      'duration': 'On trip',
      'distance': '54.1 km',
      'lastSeen': '15 sec ago',
      'ignition': true,
      'speed': 36,
      'voltage': '27.9 V',
      'driver': 'Prasad',
    },
  ];

  List<Map<String, dynamic>> get filteredBuses {
    return buses.where((bus) {
      final matchesStatus =
          selectedStatus == 'All' || bus['status'] == selectedStatus;

      final query = searchText.toLowerCase();
      final matchesSearch =
          bus['number'].toString().toLowerCase().contains(query) ||
          bus['route'].toString().toLowerCase().contains(query) ||
          bus['location'].toString().toLowerCase().contains(query);

      return matchesStatus && matchesSearch;
    }).toList();
  }

  int countStatus(String status) {
    if (status == 'All') return buses.length;
    return buses.where((bus) => bus['status'] == status).length;
  }

  Color statusColor(String status) {
    switch (status) {
      case 'Moving':
        return Colors.green;
      case 'Stopped':
        return Colors.red;
      case 'Idling':
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Bus Tracking'),
        actions: [
          IconButton(
            tooltip: 'Refresh sample data',
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Live Track',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              OutlinedButton.icon(
                onPressed: _showCustomize,
                icon: const Icon(Icons.tune),
                label: const Text('Customize'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'DEMO MODE • Sample vehicle information only',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              hintText: 'Search vehicle, route or location',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              filled: true,
            ),
            onChanged: (value) => setState(() => searchText = value),
          ),

          const SizedBox(height: 16),
          _buildMapPreview(),

          const SizedBox(height: 20),
          Text(
            'All Vehicles (${filteredBuses.length})',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          ...filteredBuses.map(_buildBusCard),

          if (filteredBuses.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('No buses match your search.')),
            ),

          const SizedBox(height: 20),
          Text(
            'Vehicle Status',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['All', 'Moving', 'Stopped', 'Idling'].map((status) {
              return ChoiceChip(
                label: Text('$status (${countStatus(status)})'),
                selected: selectedStatus == status,
                onSelected: (_) {
                  setState(() => selectedStatus = status);
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 20),
          _buildSection(
            'Vehicle Events',
            'No vehicle events in this sample.',
            Icons.event_note,
          ),
          _buildSection(
            'Consigner',
            'No consigner assigned.',
            Icons.business,
          ),
          _buildSection(
            'Vehicle Group',
            'College Buses',
            Icons.directions_bus,
          ),
          _buildSection(
            'Active Alerts',
            'No active alerts in this sample.',
            Icons.notifications_active,
          ),
          _buildSection(
            'Geofence Status',
            showGeofence
                ? 'Geofence display enabled (demo).'
                : 'Geofence display disabled.',
            Icons.location_on,
          ),

          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              setState(() {
                selectedStatus = 'All';
                searchText = '';
              });
            },
            child: const Text('Clear All Filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPreview() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: const Color(0xFFE7EBDD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _RoadPainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.deepPurple,
                  size: 42,
                ),
                Text(
                  'Campus Bus Map',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Map style: $mapStyle',
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Text(
                  '${filteredBuses.length} sample vehicles',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          if (showTraffic)
            const Positioned(
              top: 10,
              right: 10,
              child: Chip(
                label: Text('Traffic demo ON'),
                avatar: Icon(Icons.traffic, size: 18),
              ),
            ),
          if (showVehicleNumber)
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Vehicle labels enabled'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBusCard(Map<String, dynamic> bus) {
    final color = statusColor(bus['status'] as String);

    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showBusDetails(bus),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color.withValues(alpha: 0.12),
                    child: Icon(Icons.directions_bus, color: color),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          showVehicleNumber
                              ? bus['number'] as String
                              : 'College Vehicle',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          bus['route'] as String,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    tooltip: 'More options',
                    onSelected: (value) {
                      if (value == 'details') {
                        _showBusDetails(bus);
                      } else if (value == 'route') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Route view is demo-only.'),
                          ),
                        );
                      }
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                        value: 'details',
                        child: Text('Vehicle details'),
                      ),
                      PopupMenuItem(
                        value: 'route',
                        child: Text('View route (demo)'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Icon(Icons.circle, color: color, size: 10),
                  const SizedBox(width: 6),
                  Text(
                    bus['status'] as String,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    bus['duration'] as String,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Divider(height: 24),
              _detailRow(
                Icons.location_on_outlined,
                'Location',
                bus['location'] as String,
              ),
              _detailRow(
                Icons.update,
                'Last data received',
                bus['lastSeen'] as String,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _metric(
                      'Speed',
                      '${bus['speed']} km/h',
                      Icons.speed,
                    ),
                  ),
                  Expanded(
                    child: _metric(
                      'Today',
                      bus['distance'] as String,
                      Icons.route,
                    ),
                  ),
                  Expanded(
                    child: _metric(
                      'Battery',
                      bus['voltage'] as String,
                      Icons.battery_charging_full,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.key, size: 18),
                  const SizedBox(width: 6),
                  const Text('Ignition'),
                  const Spacer(),
                  Text(
                    (bus['ignition'] as bool) ? 'ON' : 'OFF',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (bus['ignition'] as bool)
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Driver: ${bus['driver']}',
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.blueGrey),
          const SizedBox(width: 8),
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _metric(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.deepPurple),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSection(String title, String subtitle, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }

  void _showBusDetails(Map<String, dynamic> bus) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              runSpacing: 14,
              children: [
                Text(
                  bus['number'] as String,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text('Route: ${bus['route']}'),
                Text('Location: ${bus['location']}'),
                Text('Status: ${bus['status']}'),
                Text('Speed: ${bus['speed']} km/h'),
                Text('Driver: ${bus['driver']}'),
                Text('Last update: ${bus['lastSeen']}'),
                const Text(
                  'This is sample data, not a live GPS feed.',
                  style: TextStyle(color: Colors.deepPurple),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCustomize() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Customize Map',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    const Text('Map Style'),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: mapStyle,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: ['Simple', 'Classic', 'Satellite', 'Terrain']
                          .map(
                            (style) => DropdownMenuItem(
                              value: style,
                              child: Text(style),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setSheetState(() => mapStyle = value);
                        }
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Show Vehicle Number'),
                      value: showVehicleNumber,
                      onChanged: (value) {
                        setSheetState(() => showVehicleNumber = value);
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Traffic'),
                      value: showTraffic,
                      onChanged: (value) {
                        setSheetState(() => showTraffic = value);
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Geofence'),
                      value: showGeofence,
                      onChanged: (value) {
                        setSheetState(() => showGeofence = value);
                      },
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.pop(sheetContext);
                      },
                      child: const Text('Apply'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _RoadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final thinRoadPaint = Paint()
      ..color = const Color(0xFFD4D8CA)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final road1 = Path()
      ..moveTo(0, size.height * 0.72)
      ..cubicTo(
        size.width * 0.3,
        size.height * 0.55,
        size.width * 0.6,
        size.height * 0.95,
        size.width,
        size.height * 0.35,
      );

    final road2 = Path()
      ..moveTo(size.width * 0.25, 0)
      ..cubicTo(
        size.width * 0.4,
        size.height * 0.35,
        size.width * 0.55,
        size.height * 0.55,
        size.width * 0.72,
        size.height,
      );

    canvas.drawPath(road1, roadPaint);
    canvas.drawPath(road2, roadPaint);
    canvas.drawPath(road1, thinRoadPaint);
    canvas.drawPath(road2, thinRoadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
