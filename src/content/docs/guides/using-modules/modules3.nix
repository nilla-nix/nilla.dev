{ lib, config }:

let
  # If you want, you can access the value of the message option from `config`. This is
  # the final value that is set in the project.
  cfg = config.message;
in
{
  options = {
    # Create our new option.
    message = lib.options.create {
      # Set a description so users know what this option is for.
      description = "The message for this project.";

      # Set the type of the option. This is used to validate the input whenever this option
      # is set. If the input is not valid then an error will be shown.
      type = lib.types.string;

      # Set the default value for this option.
      default.value = "Hello, World!";
    };
  };

  config = {
    # Now any module can set `message`!
    message = "This is my special message!";
  };
}
