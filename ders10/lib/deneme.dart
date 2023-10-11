Padding PasswordInputField() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.sp),
    child: TextFormField(
      controller: tfPassword,
      maxLength: Validation.maxPasswordCharacterSize,
      obscureText: isVisible,
      validator: (data) {
        if (data!.isEmpty) {
          return 'please_enter_password_that_is_difficult_to_guess'.tr();
        }
        if (data.length < _TextFieldInputLength.min) {
          return "Please enter ${_TextFieldInputLength.min} or more  character";
        }
        if (data.length > _TextFieldInputLength.max) {
          return "Please enter ${_TextFieldInputLength.max} or less  character";
        }
        // return null;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Icon(isVisible ? Icons.visibility : Icons.visibility_off)),
          labelText: 'prompt_password'.tr(),
          labelStyle: TextStyle(
              fontSize: ResponsiveDesign.getScreenWidth() / 23,
              color: ProductColor.black,
              fontWeight: FontWeight.bold),
          hintText: 'please_enter_the_password'.tr(),
          hintStyle:
              TextStyle(fontSize: ResponsiveDesign.getScreenWidth() / 20),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: ProductColor.darkBlue)),
          filled: true,
          fillColor: ProductColor.white,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      style: TextStyle(
          fontSize: ResponsiveDesign.getScreenWidth() / 22,
          color: ProductColor.darkBlue),
    ),
  );
}
