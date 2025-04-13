import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<CustomerAppBarItem> leading;
  final List<CustomerAppBarItem> actions;
  final String title;

  const CustomAppBar({
    super.key,
    this.leading = const [],
    this.actions = const [],
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    final builtLeading =
        canPop
            ? [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              ...leading,
            ]
            : leading;
    return Row(
      children: [
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * 0.66,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.surface.withAlpha(100),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(children: builtLeading),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Row(children: actions),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class CustomerAppBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isActive;

  const CustomerAppBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      tooltip: title,
      style: IconButton.styleFrom(
        backgroundColor:
            isActive ? Theme.of(context).colorScheme.inverseSurface : null,
        foregroundColor:
            isActive ? Theme.of(context).colorScheme.onInverseSurface : null,
      ),
    );
  }
}
