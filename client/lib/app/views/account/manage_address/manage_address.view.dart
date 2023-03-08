import 'package:client/app/views/account/manage_address/bloc/manage_address.bloc.dart';
import 'package:client/app/views/account/manage_address/bloc/manage_address.events.dart';
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
          if (state is ManageAddressInitialState) {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ManageAddressBloc>()
                        .add(const FetchAddressEvent());
                  },
                  child: const Text("Fetch Posts")),
            );
          }
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: ListView.builder(
                      itemCount: state.addressResponse!.length,
                      itemBuilder: (context, index) {
                        Datum address = state.addressResponse![0].data[index];
                        return Card(
                            child: ListTile(
                          leading: CircleAvatar(
                              child: Text(address.address.addressOwner)),
                          title: Text(address.address.addressOwner.toString()),
                        ));
                      }),
                ),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<ManageAddressBloc>()
                              .add(const GoInitialEvent());
                        },
                        child: const Text('Go Initial Page')),
                  ),
                )
              ],
            );
          }

          return const Center(child: Text('Error Occured'));
        },
      ),

      //body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
