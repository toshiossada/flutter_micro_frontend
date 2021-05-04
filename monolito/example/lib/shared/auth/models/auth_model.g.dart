// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthModelAdapter extends TypeAdapter<AuthModel> {
  @override
  final int typeId = 0;

  @override
  AuthModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthModel(
      apiToken: fields[0] as String,
      client: fields[1] as String,
      uid: fields[2] as String,
      email: fields[3] as String,
      password: fields[4] as String,
      messageError: fields[5] as String?,
      islogged: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AuthModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.apiToken)
      ..writeByte(1)
      ..write(obj.client)
      ..writeByte(2)
      ..write(obj.uid)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.messageError)
      ..writeByte(6)
      ..write(obj.islogged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
