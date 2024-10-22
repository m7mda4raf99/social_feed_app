import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'marketplace_state.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit() : super(MarketplaceInitial());
}
