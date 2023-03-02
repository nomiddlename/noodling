.import source "64spec/lib/64spec.asm"

.eval config_64spec("change_context_description_text_color", true)
.eval config_64spec("change_example_description_text_color", true)

sfspec: 

  :init_spec()
  
  :describe("stuff")
    :it("should load the accumulator with 42")
        :assert_fail

  :describe("other stuff")
    :it("should just pass")
        :assert_fail

  :finish_spec()