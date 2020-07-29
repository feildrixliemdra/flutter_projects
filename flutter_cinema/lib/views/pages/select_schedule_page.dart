part of 'page.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetail movieDetail;

  SelectSchedulePage(this.movieDetail);

  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  Theater selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    print('dates');
    print(dates);

    selectedDate = dates[0];
    print('selectedDate');
    print(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .bloc<PageBloc>()
            .add(GoToMovieDetailPage(widget.movieDetail.id));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(color: accentColor3),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              children: <Widget>[
                // note: BACK BUTTON
                Container(
                  margin: EdgeInsets.only(top: 20, left: defaultMargin),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .bloc<PageBloc>()
                          .add(GoToMovieDetailPage(widget.movieDetail.id));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                // note: CHOOSE DATE
                Container(
                  child: Text('Choose Date',
                      style: blackTextStyle.copyWith(fontSize: 20)),
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 16),
                ),
                // note: DATE CARD
                Container(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? defaultMargin : 0,
                          right:
                              (index == dates.length - 1) ? defaultMargin : 16),
                      child: DateCard(
                          date: dates[index],
                          isSelected: selectedDate == dates[index],
                          onTap: () {
                            setState(() {
                              selectedDate = dates[index];
                            });
                          }),
                    ),
                  ),
                ),
                // note: CHOOSE TIME CARD
                generateTimeTable(),
                SizedBox(
                  height: 10,
                ),
                //NOTE: NEXT BUTTON
                Align(
                  alignment: Alignment.topCenter,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: isValid ? mainColor : accentColor2,
                    child: Icon(
                      Icons.arrow_forward,
                      color: isValid ? Colors.white : Color(0xFFBEBEBE),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheater) {
      widgets.add(Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 16),
        child: Text(
          theater.name,
          style: blackTextStyle.copyWith(fontSize: 20),
        ),
      ));

      widgets.add(Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: schedule.length,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(
                  left: (index == 0) ? defaultMargin : 16,
                  right: (index == schedule.length - 1) ? defaultMargin : 0),
              child: SelectableBox(
                '',
                text: '${schedule[index]}:00',
                height: 50,
                isSelected: selectedTheater == theater &&
                    selectedTime == schedule[index],
                isEnabled: schedule[index] > DateTime.now().hour ||
                    selectedDate.day != DateTime.now().day,
                onTap: () {
                  setState(() {
                    selectedTheater = theater;
                    selectedTime = schedule[index];
                    isValid = true;
                  });
                },
              ),
            ),
          )));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
