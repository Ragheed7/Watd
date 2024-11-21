import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address.dart';
import 'package:waie/core/shared_models/user_addresses/data/repository/address_repo.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo _addressRepo;

  AddressCubit(this._addressRepo) : super(const AddressState.initial());

  Future<void> getAddresses() async {
    emit(const AddressState.loading());

    final response = await _addressRepo.getAddresses();

    response.when(
      success: (getAddresses) {
        emit(AddressState.success(getAddresses));
      },
      failure: (error) {
        emit(AddressState.error(error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }

  Future<void> createAddress(CreateAddress createAddress) async {
    emit(const AddressState.loading());

    final response = await _addressRepo.createAddress(createAddress);

    response.when(
      success: (createAddressResponse) {
        if (createAddressResponse.isSuccess) {
          if (createAddress.addressId == null) {
            emit(AddressState.addressCreated(createAddressResponse));
          } else {
            emit(AddressState.addressUpdated(createAddressResponse));
          }
          getAddresses();
        } else {
          emit(AddressState.error(error: createAddressResponse.message ?? "Failed to create/update address"));
        }
      },
      failure: (error) {
        emit(AddressState.error(error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }
}
