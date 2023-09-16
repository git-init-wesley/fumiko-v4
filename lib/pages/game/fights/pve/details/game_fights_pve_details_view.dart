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
      Column(children: [
        HomeMenusButton(setSubPageRoute: widget.setSubPageRoute),
        MenusButton(
          maxWidth: double.infinity,
          color: Colors.blueAccent,
          iconData: MdiIcons.controller,
          text: AppLocalizations.current.returnPve,
          onPressed: () => widget.setSubPageRoute(GameMainSubPages.pveRoute),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: MenusButton(
              maxWidth: double.infinity,
              color: Colors.deepPurpleAccent,
              iconData: MdiIcons.backspace,
              text: 'Recommencer',
              onPressed: widget.repeat,
            )),
      ]),
      Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                widget.user.classes.icon.toImage(width: 128),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(widget.user.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize))),
                BarProgressIndicator(
                    value: (controller._actualUser.actualVitality) / widget.user.realVitality,
                    height: 32,
                    width: 128,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.redAccent,
                    child: Text('${NumberFormatter.compact(controller._actualUser.actualVitality)}/${NumberFormatter.compact(widget.user.realVitality)}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize ?? 0))),
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                widget.monster.classes.icon.toImage(width: 128),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(widget.monster.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize))),
                BarProgressIndicator(
                    value: (controller._actualMonster.actualVitality) / widget.monster.realVitality,
                    height: 32,
                    width: 128,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.redAccent,
                    child: Text('${NumberFormatter.compact(controller._actualMonster.actualVitality)}/${NumberFormatter.compact(widget.monster.realVitality)}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize ?? 0))),
              ]),
            ]),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Column(children: controller.logs.reversed.toList())),
          ])),
    ]);
  }
}
