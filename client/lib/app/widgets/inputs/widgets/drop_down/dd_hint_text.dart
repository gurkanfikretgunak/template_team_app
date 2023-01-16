enum DDHintText {
  gender,
  price,
  rating,
}

class DDHintTextLabel {
  DDHintTextLabel();

  hintText(hintText) {
    switch (hintText) {
      case DDHintText.gender:
        return "Gender";
      case DDHintText.price:
        return "Price";
      case DDHintText.rating:
        return "Rating";
    }
  }
}
