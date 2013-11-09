require ['crafty'], (C) ->

  C.c "Face",
    init: ->
      @requires '2D, DOM, face_normal'
      @attr w: 84, h: 28

      @bind 'EnterFrame', =>
        @unbind 'EnterFrame'

        @parent.bind 'exhaleComplete', =>
          @sprite(1, 0)

        @parent.bind 'inhale', =>
          @sprite(2, 0)

        @parent.bind 'exhale', =>
          @sprite(3, 0)

