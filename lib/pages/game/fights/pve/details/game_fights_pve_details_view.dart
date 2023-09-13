part of pve_details;

class _GameFightsPveDetailsView extends State<GameFightsPveDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget._createController(context: context),
      child: Consumer<_GameFightsPveDetailsController>(builder: (context, controller, child) => _buildWidget(context, controller, child)),
    );
  }

  Widget _buildWidget(BuildContext context, _GameFightsPveDetailsController controller, Widget? child) {
    return Column(children: [
      Container(margin: const EdgeInsets.only(bottom: 16), child: HomeMenusButton(setSubPageRoute: widget.setSubPageRoute)),
      Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                widget.user.classes.icon.toImage(width: 128),
                Container(margin: const EdgeInsets.symmetric(vertical: 2), child: Text(widget.user.username)),
                BarProgressIndicator(
                    value: (controller._actualVitalityUser) / widget.user.realVitality,
                    height: 32,
                    width: 128,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.redAccent,
                    child: Text('${NumberFormatter.compact(controller._actualVitalityUser)}/${NumberFormatter.compact(widget.user.realVitality)}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize ?? 0))),
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                widget.monster.classes.icon.toImage(width: 128),
                Container(margin: const EdgeInsets.symmetric(vertical: 2), child: Text(widget.monster.classes.name)),
                BarProgressIndicator(
                    value: (controller._actualVitalityMonster) / widget.monster.realVitality,
                    height: 32,
                    width: 128,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.redAccent,
                    child: Text('${NumberFormatter.compact(controller._actualVitalityMonster)}/${NumberFormatter.compact(widget.monster.realVitality)}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize ?? 0))),
              ]),
            ]),
            Container(margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), child: Column(children: controller.logs)),
          ])),
    ]);
  }
}
