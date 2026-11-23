import 'package:flutter/material.dart';
import 'package:frudence/core/utils/asset_utils.dart';

class TappableNote extends StatefulWidget {
  final String note;

  const TappableNote({
    super.key,
    required this.note
  });

  @override
  State<TappableNote> createState() => _TappableNoteState();
}

class _TappableNoteState extends State<TappableNote> {
  final _controller = OverlayPortalController();
  final _link = LayerLink();
  final _tapGroup = Object();

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      groupId: _tapGroup,
      onTapOutside: (_) => _controller.hide(),
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _controller,
          overlayChildBuilder: (context) {
            return Positioned(
              left: 0,
              top: 0,
              child: CompositedTransformFollower(
                link: _link,
                showWhenUnlinked: false,
                targetAnchor: Alignment.bottomCenter,
                followerAnchor: Alignment.topCenter,
                offset: const Offset(0, 8),
                child: TapRegion(
                  groupId: _tapGroup,
                  child: Material(
                    elevation: 4,
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(6),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 220),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.note,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          )
                        )
                      )
                    )
                  )
                )
              )
            );
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _controller.toggle(),
            child: Image.asset(
              getDefaultIcon("note"),
              width: 20,
              height: 20,
              fit: BoxFit.contain
            )
          )
        )
      )
    );
  }
}