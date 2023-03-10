import 'package:client/app/views/account/manage_address/bloc/manage_address.bloc.dart';
import 'package:client/app/views/account/manage_address/bloc/manage_address.states.dart';
import 'package:client/app/views/account/manage_address/manage_address.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/model/address/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAddressView extends BaseView with ManageAddressWidgets {
  const ManageAddressView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: appbar(context),
      body: BlocBuilder<ManageAddressBloc, ManageAddressState>(
        builder: (context, state) {
          if (state is ManageAddressLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }

          if (state is ManageAddressLoadedState) {
            return Column(
              children: [
                ListView.builder(
                  itemCount: state.addressResponse.data.length,
                  itemBuilder: (context, index) {
                    Datum address = state.addressResponse.data[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(address.address.addressOwner),
                        ),
                        title: Text(
                          address.address.addressOwner.toString(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          if (state is ManageAddressErrorState) {
            return const Text("Err");
          }
          return const Center(child: Text('Error Occured'));
        },
      ),
      errorBody: const Text('errorrrr'),
    );
  }
}
