// presentation/pages/unit_detail_page.dart
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/responsive_utils.dart';
import 'package:erelis/features/unidad/presentation/blocs/unit_detail/unit_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/unit_content_widget.dart';

class UnitDetailPage extends StatefulWidget {
  final String unitId;
  final String cursoid;

  const UnitDetailPage(
      {super.key, required this.unitId, required this.cursoid});

  @override
  State<UnitDetailPage> createState() => _UnitDetailPageState();
}

class _UnitDetailPageState extends State<UnitDetailPage> {
  String? selectedText;
  String? activeHighlightColor;

  // En UnitDetailPage
  @override
  void initState() {
    super.initState();
    print(
        "Inicializando página de detalle para unitId: ${widget.unitId}, cursoid: ${widget.cursoid}");
    context.read<UnitDetailBloc>().add(UnitDetailEvent.loadUnit(
        unitId: widget.unitId, courseId: widget.cursoid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenido de la Unidad'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          if (selectedText != null && selectedText!.isNotEmpty)
            ..._buildHighlightActions(),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Instrucciones',
            onPressed: () {
              _showInstructionsDialog();
            },
          ),
        ],
      ),
      body: BlocBuilder<UnitDetailBloc, UnitDetailState>(
        builder: (context, state) {
          return switch (state) {
            Initial() => const Center(child: Text("Inicializando...")),
            Loading() => const Center(child: CircularProgressIndicator()),
            Loaded loaded => _buildContent(context, loaded),
            Error error => Center(child: Text("Error: ${error.message}")),
          };
        },
      ),
      bottomNavigationBar: BlocBuilder<UnitDetailBloc, UnitDetailState>(
        builder: (context, state) {
          if (state is Loaded) {
            return _buildBottomActions(context);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, Loaded state) {
    return Container(
      color: AppColors.background,
      padding: ResponsiveUtils.getContentPadding(context),
      child: UnitContentWidget(
        unit: state.unit,
        highlights: state.highlights,
        onTextSelected: (text) {
          setState(() {
            selectedText = text;
          });
        },
      ),
    );
  }

  List<Widget> _buildHighlightActions() {
    return [
      _buildHighlightButton('Naranja', AppColors.highlightOrange),
      _buildHighlightButton('Verde', AppColors.highlightGreen),
      _buildHighlightButton('Amarillo', AppColors.highlightYellow),
      IconButton(
        icon: const Icon(Icons.clear),
        tooltip: 'Cancelar selección',
        onPressed: () {
          setState(() {
            selectedText = null;
            activeHighlightColor = null;
          });
        },
      ),
    ];
  }

  Widget _buildHighlightButton(String label, Color color) {
    final isActive = activeHighlightColor == label;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? color.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: Icon(Icons.highlight, color: color),
        tooltip: 'Subrayar con $label',
        onPressed: () {
          if (selectedText != null && selectedText!.isNotEmpty) {
            context.read<UnitDetailBloc>().add(
                  UnitDetailEvent.highlightText(
                    text: selectedText!,
                    color: label,
                  ),
                );
            setState(() {
              selectedText = null;
              activeHighlightColor = null;
            });
          } else {
            setState(() {
              activeHighlightColor = label;
            });
          }
        },
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Marcar como completada'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  context.read<UnitDetailBloc>().add(
                        const UnitDetailEvent.markAsCompleted(),
                      );
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: AppColors.textSecondary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showInstructionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Instrucciones'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('📝 Cómo subrayar texto:'),
              const SizedBox(height: 8),
              Text('1. Selecciona el texto que deseas subrayar.'),
              Text('2. Elige uno de los colores de resaltado disponibles:'),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _colorLabel('Naranja', AppColors.highlightOrange),
                  _colorLabel('Verde', AppColors.highlightGreen),
                  _colorLabel('Amarillo', AppColors.highlightYellow),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Entendido'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _colorLabel(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          color: color.withOpacity(0.5),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
