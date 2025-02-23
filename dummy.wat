(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32 i32 i32)))
  (type (;4;) (func (param i32)))
  (type (;5;) (func (param i32 i32 i32 i32)))
  (type (;6;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;7;) (func))
  (type (;8;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32)))
  (type (;10;) (func (result i32)))
  (type (;11;) (func (param i32) (result i32)))
  (import "seal1" "get_storage" (func (;0;) (type 6)))
  (import "seal0" "input" (func (;1;) (type 2)))
  (import "seal2" "set_storage" (func (;2;) (type 6)))
  (import "seal0" "debug_message" (func (;3;) (type 1)))
  (import "seal0" "seal_return" (func (;4;) (type 3)))
  (import "seal0" "value_transferred" (func (;5;) (type 2)))
  (import "env" "memory" (memory (;0;) 2 16))
  (func (;6;) (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    loop (result i32)  ;; label = @1
      local.get 2
      local.get 3
      i32.eq
      if (result i32)  ;; label = @2
        local.get 0
      else
        local.get 0
        local.get 3
        i32.add
        local.get 1
        local.get 3
        i32.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end)
  (func (;7;) (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.le_u
      if  ;; label = @2
        local.get 0
        local.set 3
        loop  ;; label = @3
          local.get 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const 1
          i32.sub
          local.set 2
          br 0 (;@3;)
        end
        unreachable
      end
      local.get 0
      i32.const 1
      i32.sub
      local.set 3
      local.get 1
      i32.const 1
      i32.sub
      local.set 1
      loop  ;; label = @2
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.add
        local.get 1
        local.get 2
        i32.add
        i32.load8_u
        i32.store8
        local.get 2
        i32.const 1
        i32.sub
        local.set 2
        br 0 (;@2;)
      end
      unreachable
    end
    local.get 0)
  (func (;8;) (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    loop (result i32)  ;; label = @1
      local.get 2
      local.get 3
      i32.eq
      if (result i32)  ;; label = @2
        local.get 0
      else
        local.get 0
        local.get 3
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end)
  (func (;9;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32)
    loop  ;; label = @1
      local.get 2
      i32.eqz
      if  ;; label = @2
        i32.const 0
        return
      end
      local.get 2
      i32.const 1
      i32.sub
      local.set 2
      local.get 1
      i32.load8_u
      local.set 3
      local.get 0
      i32.load8_u
      local.set 4
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 3
      local.get 4
      i32.eq
      br_if 0 (;@1;)
    end
    local.get 4
    local.get 3
    i32.sub)
  (func (;10;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 0
    i32.load8_u offset=4
    local.set 3
    local.get 0
    i32.const 0
    i32.store8 offset=4
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.eqz
        if  ;; label = @3
          i32.const 1
          local.get 0
          i32.load
          local.tee 0
          i32.load offset=4
          local.tee 3
          local.get 2
          i32.lt_u
          br_if 2 (;@1;)
          drop
          local.get 1
          local.get 0
          i32.load
          local.tee 1
          local.get 2
          call 6
          drop
          local.get 0
          local.get 3
          local.get 2
          i32.sub
          i32.store offset=4
          local.get 0
          local.get 1
          local.get 2
          i32.add
          i32.store
          br 1 (;@2;)
        end
        local.get 1
        local.get 0
        i32.load8_u offset=5
        i32.store8
        local.get 0
        i32.load
        local.set 0
        local.get 4
        i32.const 8
        i32.add
        i32.const 1
        local.get 1
        local.get 2
        i32.const 65648
        call 11
        i32.const 1
        local.get 0
        i32.load offset=4
        local.tee 2
        local.get 4
        i32.load offset=12
        local.tee 1
        i32.lt_u
        br_if 1 (;@1;)
        drop
        local.get 4
        i32.load offset=8
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        call 6
        drop
        local.get 0
        local.get 2
        local.get 1
        i32.sub
        i32.store offset=4
        local.get 0
        local.get 1
        local.get 3
        i32.add
        i32.store
      end
      i32.const 0
    end
    local.set 3
    local.get 4
    i32.const 16
    i32.add
    global.set 0
    local.get 3)
  (func (;11;) (type 9) (param i32 i32 i32 i32 i32)
    local.get 1
    local.get 3
    i32.le_u
    if  ;; label = @1
      local.get 0
      local.get 3
      local.get 1
      i32.sub
      i32.store offset=4
      local.get 0
      local.get 1
      local.get 2
      i32.add
      i32.store
      return
    end
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 0
    i32.const 2
    i32.store offset=12
    local.get 0
    i32.const 68132
    i32.store offset=8
    local.get 0
    i64.const 2
    i64.store offset=20 align=4
    local.get 0
    i32.const 6
    i32.store offset=44
    local.get 0
    i32.const 6
    i32.store offset=36
    local.get 0
    local.get 0
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 0
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 0
    local.get 0
    i32.store offset=32
    local.get 0
    i32.const 8
    i32.add
    local.get 4
    call 25
    unreachable)
  (func (;12;) (type 5) (param i32 i32 i32 i32)
    local.get 1
    local.get 3
    i32.gt_u
    if  ;; label = @1
      local.get 1
      local.get 3
      i32.const 65808
      call 13
      unreachable
    end
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;13;) (type 3) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 68164
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 6
    i32.store offset=44
    local.get 3
    i32.const 6
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call 25
    unreachable)
  (func (;14;) (type 2) (param i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 2
      i32.const -4
      i32.lt_u
      if  ;; label = @2
        local.get 2
        i32.const 4
        i32.add
        local.tee 3
        local.get 1
        i32.load offset=4
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 1
        local.get 3
        i32.store offset=8
        local.get 1
        i32.load
        local.get 2
        i32.add
        local.get 0
        i32.store align=1
        return
      end
      i32.const 68464
      call 15
      unreachable
    end
    local.get 3
    local.get 4
    i32.const 68480
    call 13
    unreachable)
  (func (;15;) (type 4) (param i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 0
    i32.store offset=16
    local.get 1
    i32.const 1
    i32.store offset=4
    local.get 1
    i64.const 4
    i64.store offset=8 align=4
    local.get 1
    i32.const 43
    i32.store offset=28
    local.get 1
    i32.const 67317
    i32.store offset=24
    local.get 1
    local.get 1
    i32.const 24
    i32.add
    i32.store
    local.get 1
    local.get 0
    call 25
    unreachable)
  (func (;16;) (type 10) (result i32)
    (local i32 i32 i32 i64 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 16
    i32.add
    local.tee 1
    i64.const 0
    i64.store
    local.get 0
    i64.const 0
    i64.store offset=8
    local.get 0
    i32.const 16
    i32.store offset=28
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 28
    i32.add
    call 5
    local.get 0
    i32.load offset=28
    local.tee 2
    i32.const 17
    i32.ge_u
    if  ;; label = @1
      local.get 2
      i32.const 16
      i32.const 68648
      call 13
      unreachable
    end
    local.get 1
    i64.load
    local.set 3
    local.get 0
    i64.load offset=8
    local.set 4
    local.get 0
    i32.const 32
    i32.add
    global.set 0
    i32.const 5
    i32.const 4
    local.get 3
    local.get 4
    i64.or
    i64.eqz
    select)
  (func (;17;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 4
    global.set 0
    local.get 0
    i32.load
    local.set 0
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=20
        local.tee 2
        i32.const 16
        i32.and
        i32.eqz
        if  ;; label = @3
          local.get 2
          i32.const 32
          i32.and
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          call 18
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.set 0
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 2
          local.get 4
          i32.add
          i32.const 127
          i32.add
          local.get 0
          i32.const 15
          i32.and
          local.tee 3
          i32.const 48
          i32.or
          local.get 3
          i32.const 87
          i32.add
          local.get 3
          i32.const 10
          i32.lt_u
          select
          i32.store8
          local.get 2
          i32.const 1
          i32.sub
          local.set 2
          local.get 0
          i32.const 15
          i32.gt_u
          local.set 3
          local.get 0
          i32.const 4
          i32.shr_u
          local.set 0
          local.get 3
          br_if 0 (;@3;)
        end
        local.get 1
        i32.const 67620
        i32.const 2
        local.get 2
        local.get 4
        i32.add
        i32.const 128
        i32.add
        i32.const 0
        local.get 2
        i32.sub
        call 19
        br 1 (;@1;)
      end
      local.get 0
      i32.load
      local.set 0
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 4
        i32.add
        i32.const 127
        i32.add
        local.get 0
        i32.const 15
        i32.and
        local.tee 3
        i32.const 48
        i32.or
        local.get 3
        i32.const 55
        i32.add
        local.get 3
        i32.const 10
        i32.lt_u
        select
        i32.store8
        local.get 2
        i32.const 1
        i32.sub
        local.set 2
        local.get 0
        i32.const 15
        i32.gt_u
        local.set 3
        local.get 0
        i32.const 4
        i32.shr_u
        local.set 0
        local.get 3
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const 67620
      i32.const 2
      local.get 2
      local.get 4
      i32.add
      i32.const 128
      i32.add
      i32.const 0
      local.get 2
      i32.sub
      call 19
    end
    local.set 0
    local.get 4
    i32.const 128
    i32.add
    global.set 0
    local.get 0)
  (func (;18;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    i32.const 10
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 10000
      i32.lt_u
      if  ;; label = @2
        local.get 0
        local.set 4
        br 1 (;@1;)
      end
      loop  ;; label = @2
        local.get 3
        i32.const 6
        i32.add
        local.get 2
        i32.add
        local.tee 5
        i32.const 4
        i32.sub
        local.get 0
        i32.const 10000
        i32.div_u
        local.tee 4
        i32.const 55536
        i32.mul
        local.get 0
        i32.add
        local.tee 6
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 7
        i32.const 1
        i32.shl
        i32.const 67622
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 5
        i32.const 2
        i32.sub
        local.get 7
        i32.const -100
        i32.mul
        local.get 6
        i32.add
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 67622
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 2
        i32.const 4
        i32.sub
        local.set 2
        local.get 0
        i32.const 99999999
        i32.gt_u
        local.set 5
        local.get 4
        local.set 0
        local.get 5
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 4
      i32.const 99
      i32.le_u
      if  ;; label = @2
        local.get 4
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const 2
      i32.sub
      local.tee 2
      local.get 3
      i32.const 6
      i32.add
      i32.add
      local.get 4
      i32.const 100
      i32.div_u
      local.tee 0
      i32.const -100
      i32.mul
      local.get 4
      i32.add
      i32.const 1
      i32.shl
      i32.const 67622
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      local.get 0
      i32.const 10
      i32.ge_u
      if  ;; label = @2
        local.get 2
        i32.const 2
        i32.sub
        local.tee 2
        local.get 3
        i32.const 6
        i32.add
        i32.add
        local.get 0
        i32.const 1
        i32.shl
        i32.const 67622
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 2
      i32.const 1
      i32.sub
      local.tee 2
      local.get 3
      i32.const 6
      i32.add
      i32.add
      local.get 0
      i32.const 48
      i32.or
      i32.store8
    end
    local.get 1
    i32.const 1
    i32.const 0
    local.get 3
    i32.const 6
    i32.add
    local.get 2
    i32.add
    i32.const 10
    local.get 2
    i32.sub
    call 19
    local.set 0
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;19;) (type 8) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 7
    global.set 0
    local.get 0
    i32.load offset=20
    local.tee 5
    i32.const 1
    i32.and
    local.tee 8
    local.get 4
    i32.add
    local.set 6
    block  ;; label = @1
      local.get 5
      i32.const 4
      i32.and
      i32.eqz
      if  ;; label = @2
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      local.get 1
      local.get 2
      i32.add
      call 50
      local.get 6
      i32.add
      local.set 6
    end
    i32.const 43
    i32.const 1114112
    local.get 8
    select
    local.set 8
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.load offset=28
          local.tee 5
          local.get 0
          i32.load offset=32
          local.tee 0
          local.get 8
          local.get 1
          local.get 2
          call 51
          br_if 1 (;@2;)
          local.get 5
          local.get 3
          local.get 4
          local.get 0
          i32.load offset=12
          call_indirect (type 0)
          local.set 5
          br 2 (;@1;)
        end
        local.get 6
        local.get 0
        i32.load offset=4
        local.tee 9
        i32.ge_u
        if  ;; label = @3
          local.get 0
          i32.load offset=28
          local.tee 5
          local.get 0
          i32.load offset=32
          local.tee 0
          local.get 8
          local.get 1
          local.get 2
          call 51
          br_if 1 (;@2;)
          local.get 5
          local.get 3
          local.get 4
          local.get 0
          i32.load offset=12
          call_indirect (type 0)
          local.set 5
          br 2 (;@1;)
        end
        local.get 5
        i32.const 8
        i32.and
        if  ;; label = @3
          local.get 0
          i32.load offset=16
          local.set 12
          local.get 0
          i32.const 48
          i32.store offset=16
          local.get 0
          i32.load8_u offset=24
          local.set 13
          i32.const 1
          local.set 5
          local.get 0
          i32.const 1
          i32.store8 offset=24
          local.get 0
          i32.load offset=28
          local.tee 10
          local.get 0
          i32.load offset=32
          local.tee 11
          local.get 8
          local.get 1
          local.get 2
          call 51
          br_if 2 (;@1;)
          local.get 7
          i32.const 8
          i32.add
          local.get 0
          local.get 9
          local.get 6
          i32.sub
          i32.const 1
          call 52
          local.get 7
          i32.load offset=8
          local.tee 1
          i32.const 1114112
          i32.eq
          br_if 2 (;@1;)
          local.get 7
          i32.load offset=12
          local.set 2
          local.get 10
          local.get 3
          local.get 4
          local.get 11
          i32.load offset=12
          call_indirect (type 0)
          br_if 2 (;@1;)
          local.get 1
          local.get 2
          local.get 10
          local.get 11
          call 53
          br_if 2 (;@1;)
          local.get 0
          local.get 13
          i32.store8 offset=24
          local.get 0
          local.get 12
          i32.store offset=16
          i32.const 0
          local.set 5
          br 2 (;@1;)
        end
        i32.const 1
        local.set 5
        local.get 7
        local.get 0
        local.get 9
        local.get 6
        i32.sub
        i32.const 1
        call 52
        local.get 7
        i32.load
        local.tee 9
        i32.const 1114112
        i32.eq
        br_if 1 (;@1;)
        local.get 7
        i32.load offset=4
        local.set 10
        local.get 0
        i32.load offset=28
        local.tee 6
        local.get 0
        i32.load offset=32
        local.tee 0
        local.get 8
        local.get 1
        local.get 2
        call 51
        br_if 1 (;@1;)
        local.get 6
        local.get 3
        local.get 4
        local.get 0
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        local.get 9
        local.get 10
        local.get 6
        local.get 0
        call 53
        local.set 5
        br 1 (;@1;)
      end
      i32.const 1
      local.set 5
    end
    local.get 7
    i32.const 16
    i32.add
    global.set 0
    local.get 5)
  (func (;20;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    i32.load offset=12
    local.set 6
    local.get 1
    i32.load
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        block (result i32)  ;; label = @3
          block  ;; label = @4
            block (result i32)  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.load offset=4
                  local.tee 7
                  br_table 0 (;@7;) 1 (;@6;) 3 (;@4;)
                end
                i32.const 0
                local.get 6
                br_if 3 (;@3;)
                drop
                i32.const 1
                br 1 (;@5;)
              end
              local.get 6
              br_if 1 (;@4;)
              local.get 5
              i32.load offset=4
              local.set 3
              local.get 5
              i32.load
            end
            local.set 1
            local.get 2
            local.get 3
            i32.const 67152
            call 26
            local.get 2
            i32.load offset=4
            local.get 1
            local.get 3
            call 6
            drop
            local.get 0
            i32.const 8
            i32.add
            local.get 3
            i32.store
            local.get 0
            local.get 2
            i64.load align=4
            i64.store align=4
            br 2 (;@2;)
          end
          local.get 5
          i32.const 4
          i32.add
          local.set 3
          loop  ;; label = @4
            local.get 3
            i32.load
            local.get 4
            i32.add
            local.set 4
            local.get 3
            i32.const 8
            i32.add
            local.set 3
            local.get 7
            i32.const 1
            i32.sub
            local.tee 7
            br_if 0 (;@4;)
          end
          local.get 4
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          drop
          local.get 4
          i32.const 15
          i32.le_u
          if  ;; label = @4
            i32.const 0
            local.get 5
            i32.load offset=4
            i32.eqz
            br_if 1 (;@3;)
            drop
          end
          local.get 4
          i32.const 1
          i32.shl
          i32.const 0
          local.get 4
          i32.const 0
          i32.ge_s
          select
        end
        i32.const 67284
        call 26
        local.get 2
        local.get 1
        call 27
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i64.load align=4
        i64.store align=4
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        i32.const 8
        i32.add
        i32.load
        i32.store
      end
      local.get 2
      i32.const 16
      i32.add
      global.set 0
      return
    end
    global.get 0
    i32.const -64
    i32.add
    local.tee 0
    global.set 0
    local.get 0
    i32.const 86
    i32.store offset=12
    local.get 0
    i32.const 66820
    i32.store offset=8
    local.get 0
    i32.const 66424
    i32.store offset=20
    local.get 0
    local.get 2
    i32.const 15
    i32.add
    i32.store offset=16
    local.get 0
    i32.const 2
    i32.store offset=28
    local.get 0
    i32.const 67604
    i32.store offset=24
    local.get 0
    i64.const 2
    i64.store offset=36 align=4
    local.get 0
    i32.const 2
    i32.store offset=60
    local.get 0
    i32.const 3
    i32.store offset=52
    local.get 0
    local.get 0
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 0
    local.get 0
    i32.const 16
    i32.add
    i32.store offset=56
    local.get 0
    local.get 0
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 0
    i32.const 24
    i32.add
    i32.const 67020
    call 25
    unreachable)
  (func (;21;) (type 1) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    call 28)
  (func (;22;) (type 2) (param i32 i32)
    block  ;; label = @1
      i32.const 68720
      i32.load8_u
      i32.eqz
      if  ;; label = @2
        i32.const 68721
        i32.load8_u
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 1
      call 3
      i32.const 9
      i32.ne
      if  ;; label = @2
        i32.const 68720
        i32.const 1
        i32.store8
      end
      i32.const 68721
      i32.const 1
      i32.store8
    end)
  (func (;23;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 3
    local.get 0
    i32.load
    local.set 2
    loop  ;; label = @1
      local.get 1
      i32.eqz
      local.get 2
      local.get 3
      i32.eq
      i32.or
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 2
        local.get 2
        i32.load8_u
        i32.const 67822
        i32.add
        i32.load8_u
        i32.add
        local.tee 2
        i32.store
        local.get 1
        i32.const 1
        i32.sub
        local.set 1
        br 1 (;@1;)
      end
    end
    i32.const 1114112
    local.set 4
    block  ;; label = @1
      local.get 1
      local.get 2
      local.get 3
      i32.eq
      i32.or
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 1
      i32.add
      i32.store
      local.get 2
      i32.load8_u
      local.tee 4
      i32.const 24
      i32.shl
      i32.const 24
      i32.shr_s
      i32.const 0
      i32.ge_s
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2
      i32.add
      i32.store
      local.get 2
      i32.load8_u offset=1
      i32.const 63
      i32.and
      local.set 3
      local.get 4
      i32.const 31
      i32.and
      local.set 1
      local.get 4
      i32.const 223
      i32.le_u
      if  ;; label = @2
        local.get 1
        i32.const 6
        i32.shl
        local.get 3
        i32.or
        return
      end
      local.get 0
      local.get 2
      i32.const 3
      i32.add
      i32.store
      local.get 2
      i32.load8_u offset=2
      i32.const 63
      i32.and
      local.get 3
      i32.const 6
      i32.shl
      i32.or
      local.set 3
      local.get 4
      i32.const 240
      i32.lt_u
      if  ;; label = @2
        local.get 3
        local.get 1
        i32.const 12
        i32.shl
        i32.or
        return
      end
      local.get 0
      local.get 2
      i32.const 4
      i32.add
      i32.store
      local.get 1
      i32.const 18
      i32.shl
      i32.const 1835008
      i32.and
      local.get 2
      i32.load8_u offset=3
      i32.const 63
      i32.and
      local.get 3
      i32.const 6
      i32.shl
      i32.or
      i32.or
      local.set 4
    end
    local.get 4)
  (func (;24;) (type 1) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 68180
    i32.store offset=8
    local.get 2
    i64.const 1
    i64.store offset=20 align=4
    local.get 2
    i32.const 3
    i32.store offset=36
    local.get 2
    local.get 0
    i32.load8_u
    i32.const 2
    i32.shl
    local.tee 0
    i32.const 68664
    i32.add
    i32.load
    i32.store offset=44
    local.get 2
    local.get 0
    i32.const 68684
    i32.add
    i32.load
    i32.store offset=40
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 2
    local.get 2
    i32.const 40
    i32.add
    i32.store offset=32
    local.get 1
    i32.load offset=28
    local.get 1
    i32.load offset=32
    local.get 2
    i32.const 8
    i32.add
    call 44
    local.set 0
    local.get 2
    i32.const 48
    i32.add
    global.set 0
    local.get 0)
  (func (;25;) (type 2) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 1
    i32.store16 offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    call 49
    unreachable)
  (func (;26;) (type 3) (param i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      local.get 1
      i32.const 0
      i32.ge_s
      if (result i32)  ;; label = @2
        local.get 1
        i32.eqz
        if  ;; label = @3
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 4
        i32.const 8
        i32.add
        local.get 1
        call 42
        local.get 4
        i32.load offset=8
        local.tee 3
        br_if 1 (;@1;)
        i32.const 1
      else
        i32.const 0
      end
      local.get 1
      local.get 2
      call 38
      unreachable
    end
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;27;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.const 66448
    local.get 1
    call 44)
  (func (;28;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block (result i32)  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            local.tee 6
            local.get 0
            i32.load offset=8
            local.tee 3
            i32.or
            if  ;; label = @5
              local.get 3
              i32.const 1
              i32.and
              i32.eqz
              br_if 3 (;@2;)
              local.get 0
              i32.load offset=12
              local.set 3
              local.get 4
              i32.const 0
              i32.store offset=44
              local.get 4
              local.get 1
              i32.store offset=36
              local.get 4
              local.get 1
              local.get 2
              i32.add
              i32.store offset=40
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              loop  ;; label = @6
                local.get 3
                i32.const 1
                i32.sub
                local.tee 3
                if  ;; label = @7
                  local.get 4
                  i32.const 24
                  i32.add
                  local.get 4
                  i32.const 36
                  i32.add
                  call 55
                  local.get 4
                  i32.load offset=28
                  i32.const 1114112
                  i32.ne
                  br_if 1 (;@6;)
                  br 5 (;@2;)
                end
              end
              local.get 4
              i32.const 16
              i32.add
              local.get 4
              i32.const 36
              i32.add
              call 55
              local.get 4
              i32.load offset=20
              i32.const 1114112
              i32.eq
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 4
                i32.load offset=16
                local.tee 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                local.get 5
                i32.le_u
                if  ;; label = @7
                  local.get 2
                  local.get 5
                  i32.eq
                  br_if 1 (;@6;)
                  br 3 (;@4;)
                end
                local.get 1
                local.get 5
                i32.add
                i32.load8_s
                i32.const -64
                i32.lt_s
                br_if 2 (;@4;)
              end
              local.get 1
              br 2 (;@3;)
            end
            local.get 0
            i32.load offset=28
            local.get 1
            local.get 2
            local.get 0
            i32.load offset=32
            i32.load offset=12
            call_indirect (type 0)
            local.set 3
            br 3 (;@1;)
          end
          i32.const 0
        end
        local.set 3
        local.get 5
        local.get 2
        local.get 3
        select
        local.set 2
        local.get 3
        local.get 1
        local.get 3
        select
        local.set 1
      end
      local.get 6
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.load offset=28
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=32
        i32.load offset=12
        call_indirect (type 0)
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=4
      local.tee 3
      local.get 1
      local.get 1
      local.get 2
      i32.add
      call 50
      local.tee 5
      i32.gt_u
      if  ;; label = @2
        local.get 4
        i32.const 8
        i32.add
        local.get 0
        local.get 3
        local.get 5
        i32.sub
        i32.const 0
        call 52
        i32.const 1
        local.set 3
        local.get 4
        i32.load offset=8
        local.tee 5
        i32.const 1114112
        i32.eq
        br_if 1 (;@1;)
        local.get 4
        i32.load offset=12
        local.set 6
        local.get 0
        i32.load offset=28
        local.tee 7
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=32
        local.tee 0
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        local.get 5
        local.get 6
        local.get 7
        local.get 0
        call 53
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=28
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=32
      i32.load offset=12
      call_indirect (type 0)
      local.set 3
    end
    local.get 4
    i32.const 48
    i32.add
    global.set 0
    local.get 3)
  (func (;29;) (type 7)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i64.const 16384
    i64.store offset=8 align=4
    local.get 0
    i32.const 68722
    i32.store offset=4
    local.get 0
    i32.const 4
    i32.add
    local.tee 1
    i32.const 0
    call 33
    local.get 1
    i32.const 0
    call 33
    local.get 0
    i32.load offset=12
    local.tee 0
    i32.const 16385
    i32.ge_u
    if  ;; label = @1
      local.get 0
      i32.const 16384
      i32.const 65956
      call 13
      unreachable
    end
    i32.const 0
    local.get 0
    call 34
    unreachable)
  (func (;30;) (type 2) (param i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i64.const 16384
    i64.store offset=8 align=4
    local.get 2
    i32.const 68722
    i32.store offset=4
    local.get 2
    i32.const 4
    i32.add
    local.tee 3
    local.get 1
    if (result i32)  ;; label = @1
      local.get 3
      i32.const 1
      call 33
      i32.const 1
    else
      i32.const 0
    end
    call 33
    local.get 2
    i32.load offset=12
    local.tee 1
    i32.const 16385
    i32.ge_u
    if  ;; label = @1
      local.get 1
      i32.const 16384
      i32.const 65956
      call 13
      unreachable
    end
    local.get 0
    local.get 1
    call 34
    unreachable)
  (func (;31;) (type 4) (param i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 0
    i32.store offset=32
    local.get 1
    i64.const 16384
    i64.store offset=40 align=4
    local.get 1
    i32.const 68722
    i32.store offset=36
    i32.const 0
    local.get 1
    i32.const 36
    i32.add
    local.tee 2
    call 14
    local.get 1
    local.get 1
    i64.load offset=36 align=4
    i64.store offset=24 align=4
    local.get 1
    i32.const 16
    i32.add
    local.get 1
    i32.const 24
    i32.add
    local.tee 3
    local.get 1
    i32.load offset=44
    call 32
    local.get 1
    i32.load offset=20
    local.set 4
    local.get 1
    i32.load offset=16
    local.set 5
    local.get 1
    i64.load offset=24 align=4
    local.set 6
    local.get 1
    i32.const 0
    i32.store offset=44
    local.get 1
    local.get 6
    i64.store offset=36 align=4
    local.get 0
    local.get 2
    call 14
    local.get 1
    local.get 1
    i64.load offset=36 align=4
    i64.store offset=24 align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 3
    local.get 1
    i32.load offset=44
    call 32
    local.get 5
    local.get 4
    local.get 1
    i32.load offset=8
    local.get 1
    i32.load offset=12
    call 2
    drop
    local.get 1
    i32.const 48
    i32.add
    global.set 0)
  (func (;32;) (type 3) (param i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    local.get 2
    local.get 1
    i32.load offset=4
    local.tee 4
    i32.gt_u
    if  ;; label = @1
      local.get 3
      i32.const 0
      i32.store offset=24
      local.get 3
      i32.const 1
      i32.store offset=12
      local.get 3
      i32.const 68320
      i32.store offset=8
      local.get 3
      i64.const 4
      i64.store offset=16 align=4
      local.get 3
      i32.const 8
      i32.add
      i32.const 68512
      call 25
      unreachable
    end
    local.get 1
    local.get 4
    local.get 2
    i32.sub
    i32.store offset=4
    local.get 1
    local.get 1
    i32.load
    local.tee 1
    local.get 2
    i32.add
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 3
    i32.const 32
    i32.add
    global.set 0)
  (func (;33;) (type 2) (param i32 i32)
    (local i32 i32)
    local.get 0
    i32.load offset=8
    local.tee 2
    local.get 0
    i32.load offset=4
    local.tee 3
    i32.lt_u
    if  ;; label = @1
      local.get 0
      local.get 2
      i32.const 1
      i32.add
      i32.store offset=8
      local.get 0
      i32.load
      local.get 2
      i32.add
      local.get 1
      i32.store8
      return
    end
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store
    local.get 0
    i32.const 2
    i32.store offset=12
    local.get 0
    i32.const 67448
    i32.store offset=8
    local.get 0
    i64.const 2
    i64.store offset=20 align=4
    local.get 0
    i32.const 6
    i32.store offset=44
    local.get 0
    i32.const 6
    i32.store offset=36
    local.get 0
    local.get 0
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 0
    local.get 0
    i32.store offset=40
    local.get 0
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=32
    local.get 0
    i32.const 8
    i32.add
    i32.const 68496
    call 25
    unreachable)
  (func (;34;) (type 2) (param i32 i32)
    local.get 0
    i32.const 68722
    local.get 1
    call 4
    unreachable)
  (func (;35;) (type 7)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 96
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call 16
            i32.const 255
            i32.and
            i32.const 5
            i32.eq
            if  ;; label = @5
              local.get 1
              i32.const 16384
              i32.store offset=60
              i32.const 68722
              local.get 1
              i32.const 60
              i32.add
              call 1
              local.get 1
              i32.const 32
              i32.add
              local.get 1
              i32.load offset=60
              i32.const 68722
              i32.const 16384
              call 12
              local.get 1
              i32.load offset=32
              local.set 2
              local.get 1
              local.get 1
              i32.load offset=36
              local.tee 3
              i32.store offset=56
              local.get 1
              local.get 2
              i32.store offset=52
              local.get 3
              i32.const 4
              i32.lt_u
              br_if 3 (;@2;)
              local.get 1
              local.get 3
              i32.const 4
              i32.sub
              local.tee 8
              i32.store offset=56
              local.get 2
              i32.load align=1
              local.tee 0
              i32.const 24
              i32.shr_u
              local.set 5
              local.get 0
              i32.const 16
              i32.shr_u
              local.set 7
              local.get 0
              i32.const 8
              i32.shr_u
              local.set 4
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.const 255
                      i32.and
                      local.tee 0
                      i32.const 39
                      i32.ne
                      if  ;; label = @10
                        local.get 8
                        i32.eqz
                        local.get 0
                        i32.const 250
                        i32.ne
                        local.get 5
                        i32.const 246
                        i32.ne
                        i32.or
                        local.get 4
                        i32.const 255
                        i32.and
                        i32.const 128
                        i32.ne
                        local.get 7
                        i32.const 255
                        i32.and
                        i32.const 194
                        i32.ne
                        i32.or
                        i32.or
                        i32.or
                        br_if 8 (;@2;)
                        local.get 1
                        local.get 3
                        i32.const 5
                        i32.sub
                        local.tee 4
                        i32.store offset=56
                        local.get 1
                        local.get 2
                        i32.const 5
                        i32.add
                        i32.store offset=52
                        local.get 2
                        i32.load8_u offset=4
                        local.tee 0
                        i32.const 3
                        i32.and
                        i32.const 1
                        i32.sub
                        br_table 2 (;@8;) 3 (;@7;) 4 (;@6;) 1 (;@9;)
                      end
                      local.get 5
                      i32.const 55
                      i32.ne
                      local.get 4
                      i32.const 255
                      i32.and
                      i32.const 216
                      i32.ne
                      i32.or
                      local.get 7
                      i32.const 255
                      i32.and
                      i32.const 241
                      i32.ne
                      i32.or
                      br_if 7 (;@2;)
                      i32.const -2147483648
                      local.set 6
                      br 8 (;@1;)
                    end
                    local.get 0
                    i32.const 2
                    i32.shr_u
                    local.set 2
                    br 5 (;@3;)
                  end
                  local.get 1
                  local.get 0
                  i32.store8 offset=65
                  local.get 1
                  i32.const 1
                  i32.store8 offset=64
                  local.get 1
                  local.get 1
                  i32.const 52
                  i32.add
                  i32.store offset=60
                  local.get 1
                  i32.const 0
                  i32.store16 offset=84
                  local.get 1
                  i32.const 60
                  i32.add
                  local.get 1
                  i32.const 84
                  i32.add
                  i32.const 2
                  call 10
                  br_if 5 (;@2;)
                  local.get 1
                  i32.load16_u offset=84
                  local.tee 0
                  i32.const 255
                  i32.le_u
                  br_if 5 (;@2;)
                  local.get 0
                  i32.const 2
                  i32.shr_u
                  local.set 2
                  br 4 (;@3;)
                end
                local.get 1
                local.get 0
                i32.store8 offset=65
                local.get 1
                i32.const 1
                i32.store8 offset=64
                local.get 1
                local.get 1
                i32.const 52
                i32.add
                i32.store offset=60
                local.get 1
                i32.const 0
                i32.store offset=84
                local.get 1
                i32.const 60
                i32.add
                local.get 1
                i32.const 84
                i32.add
                i32.const 4
                call 10
                br_if 4 (;@2;)
                local.get 1
                i32.load offset=84
                local.tee 0
                i32.const 65536
                i32.lt_u
                br_if 4 (;@2;)
                local.get 0
                i32.const 2
                i32.shr_u
                local.set 2
                br 3 (;@3;)
              end
              local.get 0
              i32.const 4
              i32.lt_u
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
            local.get 1
            i32.const 4
            i32.store8 offset=60
            local.get 1
            i32.const 60
            i32.add
            call 36
            unreachable
          end
          local.get 4
          i32.const 4
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          local.get 3
          i32.const 9
          i32.sub
          i32.store offset=56
          local.get 1
          local.get 2
          i32.const 9
          i32.add
          i32.store offset=52
          local.get 2
          i32.load offset=5 align=1
          local.tee 2
          i32.const 1073741824
          i32.lt_u
          br_if 1 (;@2;)
        end
        local.get 1
        i32.load offset=56
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const -64
        i32.sub
        local.set 8
        local.get 1
        i32.const 68
        i32.add
        local.set 9
        i32.const 0
        local.set 3
        i32.const 1
        local.set 4
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            if  ;; label = @5
              i32.const 16384
              local.get 2
              local.get 2
              i32.const 16384
              i32.ge_u
              select
              local.tee 7
              local.get 6
              local.get 3
              i32.sub
              i32.le_u
              if  ;; label = @6
                local.get 3
                local.get 7
                i32.add
                local.set 0
                br 2 (;@4;)
              end
              i32.const 0
              local.set 5
              local.get 3
              local.get 3
              local.get 7
              i32.add
              local.tee 0
              i32.gt_u
              local.get 0
              i32.const 0
              i32.lt_s
              i32.or
              i32.eqz
              if  ;; label = @6
                local.get 6
                if (result i32)  ;; label = @7
                  local.get 1
                  i32.const 1
                  i32.store offset=64
                  local.get 1
                  local.get 4
                  i32.store offset=60
                  local.get 9
                else
                  local.get 8
                end
                local.get 6
                i32.store
                local.get 1
                i32.const 84
                i32.add
                local.get 0
                local.get 1
                i32.const 60
                i32.add
                call 37
                local.get 1
                i32.load offset=88
                local.set 5
                local.get 1
                i32.load offset=84
                i32.eqz
                if  ;; label = @7
                  local.get 5
                  local.set 4
                  local.get 0
                  local.set 6
                  br 3 (;@4;)
                end
                local.get 5
                i32.const -2147483647
                i32.eq
                br_if 2 (;@4;)
                local.get 1
                i32.load offset=92
                local.set 0
              end
              local.get 5
              local.get 0
              i32.const 65792
              call 38
              unreachable
            end
            local.get 6
            i32.const -2147483648
            i32.eq
            br_if 2 (;@2;)
            local.get 3
            i32.const 7
            i32.sub
            local.tee 0
            i32.const 0
            local.get 0
            local.get 3
            i32.le_u
            select
            local.set 8
            local.get 4
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.get 4
            i32.sub
            local.set 9
            i32.const 0
            local.set 2
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 2
                      local.get 3
                      i32.lt_u
                      if  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 2
                              local.get 4
                              i32.add
                              i32.load8_u
                              local.tee 0
                              i32.const 24
                              i32.shl
                              i32.const 24
                              i32.shr_s
                              local.tee 7
                              i32.const 0
                              i32.lt_s
                              if  ;; label = @14
                                local.get 0
                                i32.const 67822
                                i32.add
                                i32.load8_u
                                i32.const 2
                                i32.sub
                                br_table 1 (;@13;) 2 (;@12;) 3 (;@11;) 12 (;@2;)
                              end
                              local.get 9
                              local.get 2
                              i32.sub
                              i32.const 3
                              i32.and
                              br_if 7 (;@6;)
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 2
                                  local.get 8
                                  i32.ge_u
                                  br_if 0 (;@15;)
                                  local.get 2
                                  local.get 4
                                  i32.add
                                  local.tee 0
                                  i32.load offset=4
                                  local.get 0
                                  i32.load
                                  i32.or
                                  i32.const -2139062144
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 2
                                  i32.const 8
                                  i32.add
                                  local.set 2
                                  br 1 (;@14;)
                                end
                              end
                              loop  ;; label = @14
                                local.get 2
                                local.get 3
                                i32.ge_u
                                br_if 9 (;@5;)
                                local.get 2
                                local.get 4
                                i32.add
                                i32.load8_s
                                i32.const 0
                                i32.lt_s
                                br_if 9 (;@5;)
                                local.get 2
                                i32.const 1
                                i32.add
                                local.set 2
                                br 0 (;@14;)
                              end
                              unreachable
                            end
                            local.get 2
                            i32.const 1
                            i32.add
                            local.tee 2
                            local.get 3
                            i32.ge_u
                            br_if 10 (;@2;)
                            local.get 2
                            local.get 4
                            i32.add
                            i32.load8_s
                            i32.const -65
                            i32.gt_s
                            br_if 10 (;@2;)
                            br 5 (;@7;)
                          end
                          local.get 2
                          i32.const 1
                          i32.add
                          local.tee 5
                          local.get 3
                          i32.ge_u
                          br_if 9 (;@2;)
                          local.get 4
                          local.get 5
                          i32.add
                          i32.load8_s
                          local.set 5
                          block  ;; label = @12
                            local.get 0
                            i32.const 224
                            i32.ne
                            if  ;; label = @13
                              local.get 0
                              i32.const 237
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 7
                              i32.const 31
                              i32.add
                              i32.const 255
                              i32.and
                              i32.const 12
                              i32.lt_u
                              br_if 4 (;@9;)
                              local.get 7
                              i32.const -2
                              i32.and
                              i32.const -18
                              i32.ne
                              br_if 11 (;@2;)
                              local.get 5
                              i32.const -64
                              i32.lt_s
                              br_if 5 (;@8;)
                              br 11 (;@2;)
                            end
                            local.get 5
                            i32.const -32
                            i32.and
                            i32.const -96
                            i32.eq
                            br_if 4 (;@8;)
                            br 10 (;@2;)
                          end
                          local.get 5
                          i32.const -97
                          i32.gt_s
                          br_if 9 (;@2;)
                          br 3 (;@8;)
                        end
                        local.get 2
                        i32.const 1
                        i32.add
                        local.tee 5
                        local.get 3
                        i32.ge_u
                        br_if 8 (;@2;)
                        local.get 4
                        local.get 5
                        i32.add
                        i32.load8_s
                        local.set 5
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.const 240
                                i32.sub
                                br_table 1 (;@13;) 0 (;@14;) 0 (;@14;) 0 (;@14;) 2 (;@12;) 0 (;@14;)
                              end
                              local.get 7
                              i32.const 15
                              i32.add
                              i32.const 255
                              i32.and
                              i32.const 2
                              i32.gt_u
                              br_if 11 (;@2;)
                              local.get 5
                              i32.const -64
                              i32.lt_s
                              br_if 2 (;@11;)
                              br 11 (;@2;)
                            end
                            local.get 5
                            i32.const 112
                            i32.add
                            i32.const 255
                            i32.and
                            i32.const 48
                            i32.lt_u
                            br_if 1 (;@11;)
                            br 10 (;@2;)
                          end
                          local.get 5
                          i32.const -113
                          i32.gt_s
                          br_if 9 (;@2;)
                        end
                        local.get 2
                        i32.const 2
                        i32.add
                        local.tee 0
                        local.get 3
                        i32.ge_u
                        br_if 8 (;@2;)
                        local.get 0
                        local.get 4
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        br_if 8 (;@2;)
                        local.get 2
                        i32.const 3
                        i32.add
                        local.tee 2
                        local.get 3
                        i32.ge_u
                        br_if 8 (;@2;)
                        local.get 2
                        local.get 4
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.le_s
                        br_if 3 (;@7;)
                        br 8 (;@2;)
                      end
                      local.get 6
                      i32.const -2147483647
                      i32.eq
                      br_if 7 (;@2;)
                      local.get 4
                      i32.const 8
                      i32.shr_u
                      local.set 2
                      br 8 (;@1;)
                    end
                    local.get 5
                    i32.const -64
                    i32.ge_s
                    br_if 6 (;@2;)
                  end
                  local.get 2
                  i32.const 2
                  i32.add
                  local.tee 2
                  local.get 3
                  i32.ge_u
                  br_if 5 (;@2;)
                  local.get 2
                  local.get 4
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  br_if 5 (;@2;)
                end
                local.get 2
                i32.const 1
                i32.add
                local.set 2
                br 1 (;@5;)
              end
              local.get 2
              i32.const 1
              i32.add
              local.set 2
              br 0 (;@5;)
            end
            unreachable
          end
          local.get 1
          i32.const 24
          i32.add
          local.get 3
          local.get 4
          local.get 0
          i32.const 65776
          call 11
          local.get 1
          i32.load offset=56
          local.tee 5
          local.get 1
          i32.load offset=28
          local.tee 3
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.load offset=24
          local.get 1
          i32.load offset=52
          local.tee 10
          local.get 3
          call 6
          drop
          local.get 1
          local.get 5
          local.get 3
          i32.sub
          i32.store offset=56
          local.get 1
          local.get 3
          local.get 10
          i32.add
          i32.store offset=52
          local.get 2
          local.get 7
          i32.sub
          local.set 2
          local.get 0
          local.set 3
          br 0 (;@3;)
        end
        unreachable
      end
      i32.const 1
      i32.const 1
      call 30
      unreachable
    end
    local.get 1
    local.get 2
    i32.store16 offset=45 align=1
    local.get 1
    i32.const 47
    i32.add
    local.get 2
    i32.const 16
    i32.shr_u
    i32.store8
    local.get 1
    local.get 3
    i32.store offset=48
    local.get 1
    local.get 4
    i32.store8 offset=44
    local.get 1
    local.get 6
    i32.store offset=40
    local.get 1
    i32.const 0
    i32.store offset=92
    local.get 1
    i64.const 16384
    i64.store offset=64 align=4
    local.get 1
    i32.const 68722
    i32.store offset=60
    i32.const 0
    local.get 1
    i32.const 60
    i32.add
    local.tee 3
    call 14
    local.get 1
    local.get 1
    i64.load offset=60 align=4
    i64.store offset=84 align=4
    local.get 1
    i32.const 16
    i32.add
    local.get 1
    i32.const 84
    i32.add
    local.get 1
    i32.load offset=68
    call 32
    local.get 1
    i32.load offset=20
    local.set 4
    local.get 1
    i32.load offset=16
    local.set 6
    local.get 1
    i32.load offset=84
    local.set 0
    local.get 1
    local.get 1
    i32.load offset=88
    local.tee 5
    i32.store offset=60
    local.get 6
    local.get 4
    local.get 0
    local.get 3
    call 0
    local.set 3
    local.get 1
    i32.const 8
    i32.add
    local.get 1
    i32.load offset=60
    local.get 0
    local.get 5
    call 12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              br_table 1 (;@4;) 0 (;@5;) 0 (;@5;) 2 (;@3;) 0 (;@5;)
            end
            local.get 1
            i32.const 0
            i32.store offset=76
            local.get 1
            i32.const 1
            i32.store offset=64
            local.get 1
            i32.const 66000
            i32.store offset=60
            local.get 1
            i64.const 4
            i64.store offset=68 align=4
            local.get 1
            i32.const 60
            i32.add
            i32.const 66008
            call 25
            unreachable
          end
          local.get 1
          i32.load offset=12
          i32.const 4
          i32.eq
          br_if 1 (;@2;)
          local.get 1
          i32.const 0
          i32.store offset=76
          local.get 1
          i32.const 1
          i32.store offset=64
          local.get 1
          i32.const 66176
          i32.store offset=60
          br 2 (;@1;)
        end
        local.get 1
        i32.const 0
        i32.store offset=76
        local.get 1
        i32.const 1
        i32.store offset=64
        local.get 1
        i32.const 66128
        i32.store offset=60
        br 1 (;@1;)
      end
      local.get 1
      local.get 1
      i32.load offset=8
      i32.load align=1
      i32.store offset=60
      local.get 1
      i32.load offset=40
      i32.const -2147483648
      i32.eq
      if  ;; label = @2
        global.get 0
        i32.const 112
        i32.sub
        local.tee 0
        global.set 0
        local.get 0
        i32.const 1
        i32.store offset=88
        local.get 0
        i32.const 66384
        i32.store offset=84
        local.get 0
        i64.const 0
        i64.store offset=96 align=4
        local.get 0
        local.get 0
        i32.const 108
        i32.add
        local.tee 6
        i32.store offset=92
        local.get 0
        i32.const 72
        i32.add
        local.tee 4
        local.get 0
        i32.const 84
        i32.add
        local.tee 3
        call 20
        local.get 0
        i32.const 1
        i32.store offset=32
        local.get 0
        i32.const 2
        i32.store offset=44
        local.get 0
        i32.const 68332
        i32.store offset=40
        local.get 0
        i64.const 1
        i64.store offset=52 align=4
        local.get 0
        local.get 4
        i32.store offset=28
        local.get 0
        local.get 0
        i32.const 28
        i32.add
        local.tee 5
        i32.store offset=48
        local.get 0
        i32.const 12
        i32.add
        local.get 0
        i32.const 40
        i32.add
        local.tee 2
        call 20
        local.get 0
        i32.load offset=16
        local.get 0
        i32.load offset=20
        call 22
        local.get 0
        i32.const 42
        i32.store offset=24
        local.get 0
        i32.const 1
        i32.store offset=88
        local.get 0
        i32.const 66400
        i32.store offset=84
        local.get 0
        i64.const 0
        i64.store offset=96 align=4
        local.get 0
        local.get 6
        i32.store offset=92
        local.get 4
        local.get 3
        call 20
        local.get 0
        i32.const 1
        i32.store offset=68
        local.get 0
        i32.const 2
        i32.store offset=44
        local.get 0
        i32.const 68332
        i32.store offset=40
        local.get 0
        i64.const 1
        i64.store offset=52 align=4
        local.get 0
        local.get 4
        i32.store offset=64
        local.get 0
        local.get 0
        i32.const -64
        i32.sub
        i32.store offset=48
        local.get 5
        local.get 2
        call 20
        local.get 0
        i32.load offset=32
        local.get 0
        i32.load offset=36
        call 22
        local.get 1
        i32.const 60
        i32.add
        local.tee 6
        i32.load
        i32.const 42
        i32.eq
        if  ;; label = @3
          local.get 0
          i32.const 0
          i32.store offset=84
          global.get 0
          i32.const 16
          i32.sub
          local.tee 4
          global.set 0
          local.get 4
          local.get 0
          i32.const 24
          i32.add
          i32.store offset=12
          local.get 4
          local.get 6
          i32.store offset=8
          global.get 0
          i32.const 112
          i32.sub
          local.tee 0
          global.set 0
          local.get 0
          i32.const 65824
          i32.store offset=12
          local.get 0
          local.get 4
          i32.const 8
          i32.add
          i32.store offset=8
          local.get 0
          i32.const 65824
          i32.store offset=20
          local.get 0
          local.get 4
          i32.const 12
          i32.add
          i32.store offset=16
          local.get 0
          i32.const 2
          i32.store offset=28
          local.get 0
          i32.const 67464
          i32.store offset=24
          block  ;; label = @4
            local.get 3
            i32.load
            i32.eqz
            if  ;; label = @5
              local.get 0
              i32.const 3
              i32.store offset=92
              local.get 0
              i32.const 67516
              i32.store offset=88
              local.get 0
              i64.const 3
              i64.store offset=100 align=4
              local.get 0
              i32.const 2
              i32.store offset=76
              local.get 0
              i32.const 2
              i32.store offset=68
              local.get 0
              i32.const 3
              i32.store offset=60
              local.get 0
              local.get 0
              i32.const 56
              i32.add
              i32.store offset=96
              local.get 0
              local.get 0
              i32.const 16
              i32.add
              i32.store offset=72
              local.get 0
              local.get 0
              i32.const 8
              i32.add
              i32.store offset=64
              br 1 (;@4;)
            end
            local.get 0
            i32.const 48
            i32.add
            local.get 3
            i32.const 16
            i32.add
            i64.load align=4
            i64.store
            local.get 0
            i32.const 40
            i32.add
            local.get 3
            i32.const 8
            i32.add
            i64.load align=4
            i64.store
            local.get 0
            local.get 3
            i64.load align=4
            i64.store offset=32
            local.get 0
            i32.const 4
            i32.store offset=92
            local.get 0
            i32.const 67568
            i32.store offset=88
            local.get 0
            i64.const 4
            i64.store offset=100 align=4
            local.get 0
            i32.const 2
            i32.store offset=84
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 4
            i32.store offset=68
            local.get 0
            i32.const 3
            i32.store offset=60
            local.get 0
            local.get 0
            i32.const 56
            i32.add
            i32.store offset=96
            local.get 0
            local.get 0
            i32.const 16
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 8
            i32.add
            i32.store offset=72
            local.get 0
            local.get 0
            i32.const 32
            i32.add
            i32.store offset=64
          end
          local.get 0
          local.get 0
          i32.const 24
          i32.add
          i32.store offset=56
          local.get 0
          i32.const 88
          i32.add
          i32.const 66408
          call 25
          unreachable
        end
        local.get 0
        i32.const 112
        i32.add
        global.set 0
        i32.const 0
        i32.const 0
        call 30
        unreachable
      end
      local.get 1
      i32.const 60
      i32.add
      local.set 2
      global.get 0
      i32.const 144
      i32.sub
      local.tee 0
      global.set 0
      local.get 1
      i32.const 40
      i32.add
      local.tee 4
      i32.load offset=4
      local.set 3
      local.get 4
      i32.load offset=8
      local.set 6
      local.get 0
      i32.const 1
      i32.store offset=120
      local.get 0
      i32.const 66208
      i32.store offset=116
      local.get 0
      i64.const 0
      i64.store offset=128 align=4
      local.get 0
      local.get 0
      i32.const 140
      i32.add
      local.tee 7
      i32.store offset=124
      local.get 0
      i32.const 104
      i32.add
      local.tee 4
      local.get 0
      i32.const 116
      i32.add
      local.tee 5
      call 20
      local.get 0
      i32.const 1
      i32.store offset=64
      local.get 0
      i32.const 68332
      i32.store offset=72
      local.get 0
      i64.const 1
      i64.store offset=84 align=4
      local.get 0
      local.get 4
      i32.store offset=60
      local.get 0
      local.get 0
      i32.const 60
      i32.add
      local.tee 8
      i32.store offset=80
      local.get 0
      i32.const 2
      i32.store offset=76
      local.get 0
      local.get 0
      i32.const 72
      i32.add
      local.tee 9
      call 20
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      call 22
      block  ;; label = @2
        local.get 6
        i32.const 4
        i32.sub
        i32.const 2
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 1
        i32.store offset=120
        local.get 0
        i32.const 66224
        i32.store offset=116
        local.get 0
        i64.const 0
        i64.store offset=128 align=4
        local.get 0
        local.get 7
        i32.store offset=124
        local.get 4
        local.get 5
        call 20
        local.get 0
        i32.const 1
        i32.store offset=64
        local.get 0
        i32.const 2
        i32.store offset=76
        local.get 0
        i32.const 68332
        i32.store offset=72
        local.get 0
        i64.const 1
        i64.store offset=84 align=4
        local.get 0
        local.get 4
        i32.store offset=60
        local.get 0
        local.get 8
        i32.store offset=80
        local.get 0
        i32.const 12
        i32.add
        local.get 9
        call 20
        local.get 0
        i32.load offset=16
        local.get 0
        i32.load offset=20
        call 22
        local.get 0
        local.get 3
        i32.store offset=116
        local.get 0
        local.get 3
        local.get 6
        i32.add
        local.tee 4
        i32.store offset=120
        local.get 5
        i32.const 0
        call 23
        local.tee 6
        i32.const 102
        i32.ne
        if  ;; label = @3
          local.get 6
          i32.const 1114112
          i32.ne
          br_if 1 (;@2;)
          i32.const 66232
          call 15
          unreachable
        end
        local.get 0
        i32.const 1
        i32.store offset=120
        local.get 0
        i32.const 66256
        i32.store offset=116
        local.get 0
        i64.const 0
        i64.store offset=128 align=4
        local.get 0
        local.get 0
        i32.const 140
        i32.add
        i32.store offset=124
        local.get 0
        i32.const 104
        i32.add
        local.tee 6
        local.get 0
        i32.const 116
        i32.add
        local.tee 5
        call 20
        local.get 0
        i32.const 1
        i32.store offset=64
        local.get 0
        i32.const 2
        i32.store offset=76
        local.get 0
        i32.const 68332
        i32.store offset=72
        local.get 0
        i64.const 1
        i64.store offset=84 align=4
        local.get 0
        local.get 6
        i32.store offset=60
        local.get 0
        local.get 0
        i32.const 60
        i32.add
        i32.store offset=80
        local.get 0
        i32.const 24
        i32.add
        local.get 0
        i32.const 72
        i32.add
        call 20
        local.get 0
        i32.load offset=28
        local.get 0
        i32.load offset=32
        call 22
        local.get 0
        local.get 4
        i32.store offset=120
        local.get 0
        local.get 3
        i32.store offset=116
        local.get 5
        i32.const 1
        call 23
        local.tee 6
        i32.const 117
        i32.ne
        if  ;; label = @3
          local.get 6
          i32.const 1114112
          i32.ne
          br_if 1 (;@2;)
          i32.const 66264
          call 15
          unreachable
        end
        local.get 0
        i32.const 1
        i32.store offset=120
        local.get 0
        i32.const 66288
        i32.store offset=116
        local.get 0
        i64.const 0
        i64.store offset=128 align=4
        local.get 0
        local.get 0
        i32.const 140
        i32.add
        i32.store offset=124
        local.get 0
        i32.const 104
        i32.add
        local.tee 6
        local.get 0
        i32.const 116
        i32.add
        local.tee 5
        call 20
        local.get 0
        i32.const 1
        i32.store offset=64
        local.get 0
        i32.const 2
        i32.store offset=76
        local.get 0
        i32.const 68332
        i32.store offset=72
        local.get 0
        i64.const 1
        i64.store offset=84 align=4
        local.get 0
        local.get 6
        i32.store offset=60
        local.get 0
        local.get 0
        i32.const 60
        i32.add
        i32.store offset=80
        local.get 0
        i32.const 36
        i32.add
        local.get 0
        i32.const 72
        i32.add
        call 20
        local.get 0
        i32.load offset=40
        local.get 0
        i32.load offset=44
        call 22
        local.get 0
        local.get 4
        i32.store offset=120
        local.get 0
        local.get 3
        i32.store offset=116
        local.get 5
        i32.const 2
        call 23
        local.tee 6
        i32.const 122
        i32.ne
        if  ;; label = @3
          local.get 6
          i32.const 1114112
          i32.ne
          br_if 1 (;@2;)
          i32.const 66296
          call 15
          unreachable
        end
        local.get 0
        i32.const 1
        i32.store offset=120
        local.get 0
        i32.const 66320
        i32.store offset=116
        local.get 0
        i64.const 0
        i64.store offset=128 align=4
        local.get 0
        local.get 0
        i32.const 140
        i32.add
        i32.store offset=124
        local.get 0
        i32.const 104
        i32.add
        local.tee 6
        local.get 0
        i32.const 116
        i32.add
        local.tee 5
        call 20
        local.get 0
        i32.const 1
        i32.store offset=64
        local.get 0
        i32.const 2
        i32.store offset=76
        local.get 0
        i32.const 68332
        i32.store offset=72
        local.get 0
        i64.const 1
        i64.store offset=84 align=4
        local.get 0
        local.get 6
        i32.store offset=60
        local.get 0
        local.get 0
        i32.const 60
        i32.add
        i32.store offset=80
        local.get 0
        i32.const 48
        i32.add
        local.get 0
        i32.const 72
        i32.add
        call 20
        local.get 0
        i32.load offset=52
        local.get 0
        i32.load offset=56
        call 22
        local.get 0
        local.get 4
        i32.store offset=120
        local.get 0
        local.get 3
        i32.store offset=116
        local.get 5
        i32.const 3
        call 23
        local.tee 3
        i32.const 122
        i32.ne
        if  ;; label = @3
          local.get 3
          i32.const 1114112
          i32.ne
          br_if 1 (;@2;)
          i32.const 66328
          call 15
          unreachable
        end
        local.get 0
        i32.const 1
        i32.store offset=120
        local.get 0
        i32.const 66352
        i32.store offset=116
        local.get 0
        i64.const 0
        i64.store offset=128 align=4
        local.get 0
        local.get 0
        i32.const 140
        i32.add
        i32.store offset=124
        local.get 0
        i32.const 104
        i32.add
        local.tee 3
        local.get 0
        i32.const 116
        i32.add
        call 20
        local.get 0
        i32.const 1
        i32.store offset=100
        local.get 0
        i32.const 2
        i32.store offset=76
        local.get 0
        i32.const 68332
        i32.store offset=72
        local.get 0
        i64.const 1
        i64.store offset=84 align=4
        local.get 0
        local.get 3
        i32.store offset=96
        local.get 0
        local.get 0
        i32.const 96
        i32.add
        i32.store offset=80
        local.get 0
        i32.const 60
        i32.add
        local.get 0
        i32.const 72
        i32.add
        call 20
        local.get 0
        i32.load offset=64
        local.get 0
        i32.load offset=68
        call 22
        local.get 2
        i32.const 42
        i32.store
      end
      local.get 0
      i32.const 1
      i32.store offset=120
      local.get 0
      i32.const 66368
      i32.store offset=116
      local.get 0
      i64.const 0
      i64.store offset=128 align=4
      local.get 0
      local.get 0
      i32.const 140
      i32.add
      i32.store offset=124
      local.get 0
      i32.const 104
      i32.add
      local.tee 3
      local.get 0
      i32.const 116
      i32.add
      local.tee 4
      call 20
      local.get 0
      i32.const 1
      i32.store offset=100
      local.get 0
      i32.const 2
      i32.store offset=76
      local.get 0
      i32.const 68332
      i32.store offset=72
      local.get 0
      i64.const 1
      i64.store offset=84 align=4
      local.get 0
      local.get 3
      i32.store offset=96
      local.get 0
      local.get 0
      i32.const 96
      i32.add
      i32.store offset=80
      local.get 4
      local.get 0
      i32.const 72
      i32.add
      call 20
      local.get 0
      i32.load offset=120
      local.get 0
      i32.load offset=124
      call 22
      local.get 0
      i32.const 144
      i32.add
      global.set 0
      local.get 1
      i32.load offset=60
      call 31
      call 29
      unreachable
    end
    local.get 1
    i64.const 4
    i64.store offset=68 align=4
    local.get 1
    i32.const 60
    i32.add
    i32.const 66088
    call 25
    unreachable)
  (func (;36;) (type 4) (param i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 1
    i32.store offset=4
    local.get 1
    i32.const 68180
    i32.store
    local.get 1
    i64.const 1
    i64.store offset=12 align=4
    local.get 1
    i32.const 5
    i32.store offset=28
    local.get 1
    local.get 0
    i32.store offset=24
    local.get 1
    local.get 1
    i32.const 24
    i32.add
    i32.store offset=8
    local.get 1
    i32.const 66088
    call 25
    unreachable)
  (func (;37;) (type 3) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    block (result i32)  ;; label = @1
      local.get 2
      i32.load offset=4
      if  ;; label = @2
        local.get 2
        i32.load offset=8
        local.tee 4
        i32.eqz
        if  ;; label = @3
          local.get 3
          i32.const 8
          i32.add
          local.get 1
          call 42
          local.get 3
          i32.load offset=8
          local.set 2
          local.get 3
          i32.load offset=12
          br 2 (;@1;)
        end
        local.get 2
        i32.load
        local.set 5
        block  ;; label = @3
          local.get 1
          call 43
          local.tee 2
          i32.eqz
          if  ;; label = @4
            i32.const 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 2
          local.get 5
          local.get 4
          call 6
          drop
        end
        local.get 1
        br 1 (;@1;)
      end
      local.get 3
      local.get 1
      call 42
      local.get 3
      i32.load
      local.set 2
      local.get 3
      i32.load offset=4
    end
    local.set 4
    local.get 0
    local.get 2
    i32.const 1
    local.get 2
    select
    i32.store offset=4
    local.get 0
    local.get 2
    i32.eqz
    i32.store
    local.get 0
    local.get 4
    local.get 1
    local.get 2
    select
    i32.store offset=8
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;38;) (type 3) (param i32 i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      global.get 0
      i32.const 32
      i32.sub
      local.tee 0
      global.set 0
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      i32.const 1
      i32.store offset=12
      local.get 0
      i32.const 66492
      i32.store offset=8
      local.get 0
      i64.const 4
      i64.store offset=16 align=4
      local.get 0
      i32.const 8
      i32.add
      local.get 2
      call 25
      unreachable
    end
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    local.get 1
    i32.store offset=12
    local.get 0
    i32.const 2
    i32.store offset=20
    local.get 0
    i32.const 66788
    i32.store offset=16
    local.get 0
    i64.const 1
    i64.store offset=28 align=4
    local.get 0
    i32.const 6
    i32.store offset=44
    local.get 0
    local.get 0
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 0
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=40
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 0
    i32.store16 offset=12
    local.get 1
    i32.const 66804
    i32.store offset=8
    local.get 1
    local.get 0
    i32.const 16
    i32.add
    i32.store offset=4
    local.get 1
    i32.const 4
    i32.add
    call 49
    unreachable)
  (func (;39;) (type 7)
    (local i32 i32 i32)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      call 16
      i32.const 255
      i32.and
      local.tee 1
      i32.const 5
      i32.eq
      if  ;; label = @2
        local.get 0
        i32.const 16384
        i32.store offset=52
        i32.const 68722
        local.get 0
        i32.const 52
        i32.add
        call 1
        local.get 0
        local.get 0
        i32.load offset=52
        i32.const 68722
        i32.const 16384
        call 12
        local.get 0
        i32.load offset=4
        i32.const 4
        i32.ge_u
        if  ;; label = @3
          local.get 0
          i32.load
          i32.load align=1
          i32.const 1587392155
          i32.eq
          br_if 2 (;@1;)
        end
        i32.const 1
        i32.const 1
        call 30
        unreachable
      end
      local.get 0
      local.get 1
      i32.store8 offset=52
      local.get 0
      i32.const 52
      i32.add
      call 36
      unreachable
    end
    local.get 0
    i32.const 1
    i32.store offset=56
    local.get 0
    i32.const 66192
    i32.store offset=52
    local.get 0
    i64.const 0
    i64.store offset=64 align=4
    local.get 0
    local.get 0
    i32.const 76
    i32.add
    i32.store offset=60
    local.get 0
    i32.const 40
    i32.add
    local.tee 1
    local.get 0
    i32.const 52
    i32.add
    local.tee 2
    call 20
    local.get 0
    i32.const 1
    i32.store offset=36
    local.get 0
    i32.const 2
    i32.store offset=12
    local.get 0
    i32.const 68332
    i32.store offset=8
    local.get 0
    i64.const 1
    i64.store offset=20 align=4
    local.get 0
    local.get 1
    i32.store offset=32
    local.get 0
    local.get 0
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 2
    local.get 0
    i32.const 8
    i32.add
    call 20
    local.get 0
    i32.load offset=56
    local.get 0
    i32.load offset=60
    call 22
    i32.const 0
    call 31
    call 29
    unreachable)
  (func (;40;) (type 3) (param i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      local.get 2
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      i32.gt_u
      if  ;; label = @2
        local.get 4
        i32.const 8
        i32.add
        local.get 0
        local.get 3
        local.get 2
        call 41
        local.get 4
        i32.load offset=8
        local.tee 3
        i32.const -2147483647
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 1
      local.get 2
      call 6
      drop
      local.get 0
      local.get 2
      local.get 3
      i32.add
      i32.store offset=8
      local.get 4
      i32.const 16
      i32.add
      global.set 0
      return
    end
    local.get 3
    local.get 4
    i32.load offset=12
    i32.const 66620
    call 38
    unreachable)
  (func (;41;) (type 5) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      local.get 2
      local.get 2
      local.get 3
      i32.add
      local.tee 5
      i32.gt_u
      if  ;; label = @2
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      i32.const 0
      local.set 3
      i32.const 8
      local.get 1
      i32.load
      local.tee 6
      i32.const 1
      i32.shl
      local.tee 2
      local.get 5
      local.get 2
      local.get 5
      i32.gt_u
      select
      local.tee 2
      local.get 2
      i32.const 8
      i32.le_u
      select
      local.tee 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 6
      if (result i32)  ;; label = @2
        local.get 4
        i32.const 1
        i32.store offset=24
        local.get 4
        local.get 1
        i32.load offset=4
        i32.store offset=20
        local.get 4
        i32.const 28
        i32.add
      else
        local.get 4
        i32.const 24
        i32.add
      end
      local.get 6
      i32.store
      local.get 4
      i32.const 8
      i32.add
      local.get 2
      local.get 4
      i32.const 20
      i32.add
      call 37
      local.get 4
      i32.load offset=12
      local.set 3
      local.get 4
      i32.load offset=8
      if  ;; label = @2
        local.get 4
        i32.load offset=16
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.store
      local.get 1
      local.get 3
      i32.store offset=4
      i32.const -2147483647
      local.set 3
    end
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func (;42;) (type 2) (param i32 i32)
    (local i32)
    local.get 1
    if (result i32)  ;; label = @1
      i32.const 68704
      i32.load8_u
      drop
      local.get 1
      call 43
    else
      i32.const 1
    end
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;43;) (type 11) (param i32) (result i32)
    (local i32 i32)
    block (result i32)  ;; label = @1
      i32.const 68708
      i32.load8_u
      if  ;; label = @2
        i32.const 68712
        i32.load
        br 1 (;@1;)
      end
      memory.size
      local.set 1
      i32.const 68712
      i32.const 85120
      i32.store
      i32.const 68708
      i32.const 1
      i32.store8
      i32.const 68716
      local.get 1
      i32.const 16
      i32.shl
      i32.store
      i32.const 85120
    end
    local.set 1
    block  ;; label = @1
      block (result i32)  ;; label = @2
        i32.const 0
        local.get 0
        local.get 1
        i32.add
        local.tee 2
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        drop
        i32.const 68716
        i32.load
        local.get 2
        i32.lt_u
        if  ;; label = @3
          local.get 0
          i32.const 65535
          i32.add
          local.tee 2
          i32.const 16
          i32.shr_u
          memory.grow
          local.tee 1
          i32.const -1
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          i32.const 16
          i32.shl
          local.tee 1
          local.get 2
          i32.const -65536
          i32.and
          i32.add
          local.tee 2
          local.get 1
          i32.lt_u
          br_if 2 (;@1;)
          i32.const 68716
          local.get 2
          i32.store
          i32.const 0
          local.get 0
          local.get 1
          i32.add
          local.tee 2
          local.get 1
          i32.lt_u
          br_if 1 (;@2;)
          drop
        end
        i32.const 68712
        local.get 2
        i32.store
        local.get 1
      end
      return
    end
    i32.const 0)
  (func (;44;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const -64
    i32.add
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=60
    local.get 3
    local.get 0
    i32.store offset=56
    local.get 3
    i32.const 3
    i32.store8 offset=52
    local.get 3
    i64.const 32
    i64.store offset=44 align=4
    i32.const 0
    local.set 0
    local.get 3
    i32.const 0
    i32.store offset=36
    local.get 3
    i32.const 0
    i32.store offset=28
    block (result i32)  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=16
          local.tee 1
          i32.eqz
          if  ;; label = @4
            local.get 2
            i32.load offset=12
            local.tee 1
            i32.const 3
            i32.shl
            local.set 5
            local.get 1
            i32.const 536870911
            i32.and
            local.set 6
            local.get 2
            i32.load offset=4
            local.set 8
            local.get 2
            i32.load
            local.set 7
            local.get 2
            i32.load offset=8
            local.set 1
            loop  ;; label = @5
              local.get 0
              local.get 5
              i32.eq
              br_if 2 (;@3;)
              local.get 0
              local.get 7
              i32.add
              local.tee 2
              i32.const 4
              i32.add
              i32.load
              local.tee 4
              if  ;; label = @6
                local.get 3
                i32.load offset=56
                local.get 2
                i32.load
                local.get 4
                local.get 3
                i32.load offset=60
                i32.load offset=12
                call_indirect (type 0)
                br_if 4 (;@2;)
              end
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 1
              i32.load offset=4
              local.set 2
              local.get 1
              i32.load
              local.set 4
              local.get 1
              i32.const 8
              i32.add
              local.set 1
              local.get 4
              local.get 3
              i32.const 28
              i32.add
              local.get 2
              call_indirect (type 1)
              i32.eqz
              br_if 0 (;@5;)
            end
            br 2 (;@2;)
          end
          local.get 2
          i32.load offset=20
          local.tee 0
          i32.const 5
          i32.shl
          local.set 5
          local.get 0
          i32.const 134217727
          i32.and
          local.set 6
          local.get 2
          i32.load offset=12
          local.set 9
          local.get 2
          i32.load offset=8
          local.set 4
          local.get 2
          i32.load offset=4
          local.set 8
          local.get 2
          i32.load
          local.tee 7
          local.set 0
          loop  ;; label = @4
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.tee 2
            if  ;; label = @5
              local.get 3
              i32.load offset=56
              local.get 0
              i32.load
              local.get 2
              local.get 3
              i32.load offset=60
              i32.load offset=12
              call_indirect (type 0)
              br_if 3 (;@2;)
            end
            local.get 3
            local.get 1
            i32.load offset=16
            i32.store offset=44
            local.get 3
            local.get 1
            i32.load8_u offset=28
            i32.store8 offset=52
            local.get 3
            local.get 1
            i32.load offset=24
            i32.store offset=48
            local.get 3
            i32.const 16
            i32.add
            local.get 4
            local.get 1
            i32.load offset=8
            local.get 1
            i32.const 12
            i32.add
            i32.load
            call 59
            local.get 3
            local.get 3
            i64.load offset=16
            i64.store offset=28 align=4
            local.get 3
            i32.const 8
            i32.add
            local.get 4
            local.get 1
            i32.load
            local.get 1
            i32.const 4
            i32.add
            i32.load
            call 59
            local.get 3
            local.get 3
            i64.load offset=8
            i64.store offset=36 align=4
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            local.get 5
            i32.const 32
            i32.sub
            local.set 5
            local.get 1
            i32.load offset=20
            local.set 2
            local.get 1
            i32.const 32
            i32.add
            local.set 1
            local.get 4
            local.get 2
            i32.const 3
            i32.shl
            i32.add
            local.tee 2
            i32.load
            local.get 3
            i32.const 28
            i32.add
            local.get 2
            i32.load offset=4
            call_indirect (type 1)
            i32.eqz
            br_if 0 (;@4;)
          end
          br 1 (;@2;)
        end
        local.get 6
        local.get 8
        i32.lt_u
        if  ;; label = @3
          local.get 3
          i32.load offset=56
          local.get 7
          local.get 6
          i32.const 3
          i32.shl
          i32.add
          local.tee 0
          i32.load
          local.get 0
          i32.load offset=4
          local.get 3
          i32.load offset=60
          i32.load offset=12
          call_indirect (type 0)
          br_if 1 (;@2;)
        end
        i32.const 0
        br 1 (;@1;)
      end
      i32.const 1
    end
    local.set 1
    local.get 3
    i32.const -64
    i32.sub
    global.set 0
    local.get 1)
  (func (;45;) (type 4) (param i32)
    nop)
  (func (;46;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 40
    i32.const 0)
  (func (;47;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block (result i32)  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.ge_u
            if  ;; label = @5
              local.get 2
              i32.const 0
              i32.store offset=12
              local.get 1
              i32.const 2048
              i32.lt_u
              br_if 1 (;@4;)
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 2 (;@3;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              local.get 2
              i32.const 12
              i32.add
              i32.const 2
              i32.or
              br 3 (;@2;)
            end
            local.get 0
            i32.load offset=8
            local.tee 4
            local.get 0
            i32.load
            i32.eq
            if  ;; label = @5
              global.get 0
              i32.const 16
              i32.sub
              local.tee 3
              global.set 0
              local.get 3
              i32.const 8
              i32.add
              local.get 0
              local.get 0
              i32.load
              i32.const 1
              call 41
              local.get 3
              i32.load offset=8
              local.tee 5
              i32.const -2147483647
              i32.ne
              if  ;; label = @6
                local.get 5
                local.get 3
                i32.load offset=12
                i32.const 67300
                call 38
                unreachable
              end
              local.get 3
              i32.const 16
              i32.add
              global.set 0
            end
            local.get 0
            local.get 4
            i32.const 1
            i32.add
            i32.store offset=8
            local.get 0
            i32.load offset=4
            local.get 4
            i32.add
            local.get 1
            i32.store8
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 192
          i32.or
          i32.store8 offset=12
          i32.const 2
          local.set 3
          local.get 2
          i32.const 12
          i32.add
          i32.const 1
          i32.or
          br 1 (;@2;)
        end
        local.get 2
        local.get 1
        i32.const 18
        i32.shr_u
        i32.const 240
        i32.or
        i32.store8 offset=12
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=14
        local.get 2
        local.get 1
        i32.const 12
        i32.shr_u
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        i32.const 4
        local.set 3
        local.get 2
        i32.const 12
        i32.add
        i32.const 3
        i32.or
      end
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      local.get 0
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      call 40
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    i32.const 0)
  (func (;48;) (type 1) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=28
    i32.const 66440
    i32.const 5
    local.get 1
    i32.load offset=32
    i32.load offset=12
    call_indirect (type 0))
  (func (;49;) (type 4) (param i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store
    local.get 1
    i32.const 2
    i32.store offset=20
    local.get 1
    i32.const 68332
    i32.store offset=16
    local.get 1
    i64.const 1
    i64.store offset=28 align=4
    local.get 1
    i32.const 7
    i32.store offset=44
    local.get 1
    local.get 1
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 1
    local.get 1
    i32.store offset=40
    local.get 1
    i32.const 4
    i32.add
    local.get 1
    i32.const 16
    i32.add
    call 20
    local.get 1
    i32.load offset=8
    local.get 1
    i32.load offset=12
    call 22
    unreachable)
  (func (;50;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      local.get 0
      i32.sub
      local.tee 2
      i32.const 16
      i32.ge_u
      if  ;; label = @2
        local.get 0
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 1
        local.get 0
        i32.sub
        local.tee 0
        call 54
        local.get 1
        local.get 2
        local.get 0
        i32.sub
        local.tee 0
        i32.const -4
        i32.and
        i32.add
        local.get 0
        i32.const 3
        i32.and
        call 54
        i32.add
        local.set 3
        local.get 0
        i32.const 2
        i32.shr_u
        local.set 0
        loop  ;; label = @3
          local.get 0
          local.tee 5
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          local.tee 2
          i32.const 192
          local.get 0
          local.get 0
          i32.const 192
          i32.ge_u
          select
          local.tee 6
          i32.const 2
          i32.shl
          local.tee 7
          i32.const 1008
          i32.and
          i32.add
          local.set 8
          i32.const 0
          local.set 0
          local.get 1
          local.set 4
          loop  ;; label = @4
            block  ;; label = @5
              local.get 4
              local.get 8
              i32.ne
              if  ;; label = @6
                i32.const 0
                local.set 1
                loop  ;; label = @7
                  local.get 1
                  i32.const 16
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 0
                  local.get 1
                  local.get 4
                  i32.add
                  i32.load
                  local.tee 0
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 0
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  i32.add
                  local.set 0
                  local.get 1
                  i32.const 4
                  i32.add
                  local.set 1
                  br 0 (;@7;)
                end
                unreachable
              end
              local.get 0
              i32.const 8
              i32.shr_u
              i32.const 16711935
              i32.and
              local.get 0
              i32.const 16711935
              i32.and
              i32.add
              i32.const 65537
              i32.mul
              i32.const 16
              i32.shr_u
              local.get 3
              i32.add
              local.set 3
              local.get 5
              local.get 6
              i32.sub
              local.set 0
              local.get 2
              local.get 7
              i32.add
              local.set 1
              local.get 6
              i32.const 3
              i32.and
              i32.eqz
              br_if 2 (;@3;)
              local.get 2
              local.get 6
              i32.const 252
              i32.and
              i32.const 2
              i32.shl
              i32.add
              local.set 1
              i32.const 192
              local.get 5
              local.get 5
              i32.const 192
              i32.ge_u
              select
              i32.const 3
              i32.and
              i32.const 2
              i32.shl
              local.set 0
              i32.const 0
              local.set 2
              loop  ;; label = @6
                local.get 0
                i32.const 0
                local.get 1
                select
                if  ;; label = @7
                  local.get 2
                  local.get 1
                  i32.load
                  local.tee 2
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 2
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  i32.add
                  local.set 2
                  local.get 0
                  i32.const 4
                  i32.sub
                  local.set 0
                  local.get 1
                  i32.const 4
                  i32.add
                  local.set 1
                  br 1 (;@6;)
                else
                  local.get 2
                  i32.const 8
                  i32.shr_u
                  i32.const 16711935
                  i32.and
                  local.get 2
                  i32.const 16711935
                  i32.and
                  i32.add
                  i32.const 65537
                  i32.mul
                  i32.const 16
                  i32.shr_u
                  local.get 3
                  i32.add
                  return
                end
                unreachable
              end
              unreachable
            end
            local.get 4
            i32.const 16
            i32.add
            local.set 4
            br 0 (;@4;)
          end
          unreachable
        end
        unreachable
      end
      local.get 0
      local.get 2
      call 54
      local.set 3
    end
    local.get 3)
  (func (;51;) (type 8) (param i32 i32 i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 2
      i32.const 1114112
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 1
      i32.load offset=16
      call_indirect (type 1)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    local.get 3
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 0))
  (func (;52;) (type 5) (param i32 i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u offset=24
          local.tee 3
          local.get 3
          i32.const 3
          i32.eq
          select
          i32.const 255
          i32.and
          local.tee 3
          i32.const 1
          i32.sub
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;)
        end
        local.get 2
        local.set 3
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 2
      i32.const 1
      i32.shr_u
      local.set 3
      local.get 2
      i32.const 1
      i32.add
      i32.const 1
      i32.shr_u
      local.set 2
    end
    local.get 3
    i32.const 1
    i32.add
    local.set 3
    local.get 1
    i32.load offset=16
    local.set 4
    local.get 1
    i32.load offset=32
    local.set 5
    local.get 1
    i32.load offset=28
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 1
        i32.sub
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 4
        local.get 5
        i32.load offset=16
        call_indirect (type 1)
        i32.eqz
        br_if 0 (;@2;)
      end
      i32.const 1114112
      local.set 4
    end
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 4
    i32.store)
  (func (;53;) (type 6) (param i32 i32 i32 i32) (result i32)
    (local i32)
    block (result i32)  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 1
        local.get 4
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 2
        local.get 0
        local.get 3
        i32.load offset=16
        call_indirect (type 1)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 4
      i32.const 1
      i32.sub
    end
    local.get 1
    i32.lt_u)
  (func (;54;) (type 1) (param i32 i32) (result i32)
    (local i32)
    local.get 1
    if  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 2
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.sub
        local.tee 1
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func (;55;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    block (result i32)  ;; label = @1
      i32.const 1114112
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.load offset=4
      i32.eq
      br_if 0 (;@1;)
      drop
      local.get 1
      local.get 2
      i32.const 1
      i32.add
      local.tee 5
      i32.store
      block  ;; label = @2
        local.get 2
        i32.load8_u
        local.tee 3
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.const 2
        i32.add
        local.tee 5
        i32.store
        local.get 2
        i32.load8_u offset=1
        i32.const 63
        i32.and
        local.set 4
        local.get 3
        i32.const 31
        i32.and
        local.set 6
        local.get 3
        i32.const 223
        i32.le_u
        if  ;; label = @3
          local.get 6
          i32.const 6
          i32.shl
          local.get 4
          i32.or
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        local.get 2
        i32.const 3
        i32.add
        local.tee 5
        i32.store
        local.get 2
        i32.load8_u offset=2
        i32.const 63
        i32.and
        local.get 4
        i32.const 6
        i32.shl
        i32.or
        local.set 4
        local.get 3
        i32.const 240
        i32.lt_u
        if  ;; label = @3
          local.get 4
          local.get 6
          i32.const 12
          i32.shl
          i32.or
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        local.get 2
        i32.const 4
        i32.add
        local.tee 5
        i32.store
        i32.const 1114112
        local.get 6
        i32.const 18
        i32.shl
        i32.const 1835008
        i32.and
        local.get 2
        i32.load8_u offset=3
        i32.const 63
        i32.and
        local.get 4
        i32.const 6
        i32.shl
        i32.or
        i32.or
        local.tee 3
        i32.const 1114112
        i32.eq
        br_if 1 (;@1;)
        drop
      end
      local.get 1
      local.get 1
      i32.load offset=8
      local.tee 7
      local.get 5
      local.get 2
      i32.sub
      i32.add
      i32.store offset=8
      local.get 3
    end
    i32.store offset=4
    local.get 0
    local.get 7
    i32.store)
  (func (;56;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 1))
  (func (;57;) (type 1) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call 28)
  (func (;58;) (type 1) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=28
    local.get 1
    i32.load offset=32
    local.get 0
    call 44)
  (func (;59;) (type 5) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1
          i32.sub
          br_table 1 (;@2;) 2 (;@1;) 0 (;@3;)
        end
        i32.const 1
        local.set 4
        br 1 (;@1;)
      end
      local.get 1
      local.get 3
      i32.const 3
      i32.shl
      i32.add
      local.tee 1
      i32.load offset=4
      local.set 3
      local.get 1
      i32.load
      i32.eqz
      local.set 4
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 4
    i32.store)
  (func (;60;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 44)
  (func (;61;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load
    local.set 4
    i32.const 1
    local.set 0
    block  ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 3
      i32.const 67384
      i32.const 12
      local.get 1
      i32.load offset=32
      local.tee 5
      i32.load offset=12
      local.tee 6
      call_indirect (type 0)
      br_if 0 (;@1;)
      local.get 4
      i32.load offset=4
      local.set 1
      local.get 2
      i32.const 3
      i32.store offset=4
      local.get 2
      i32.const 67360
      i32.store
      local.get 2
      i64.const 3
      i64.store offset=12 align=4
      local.get 2
      i32.const 6
      i32.store offset=44
      local.get 2
      local.get 1
      i32.const 12
      i32.add
      i32.store offset=40
      local.get 2
      i32.const 6
      i32.store offset=36
      local.get 2
      local.get 1
      i32.const 8
      i32.add
      i32.store offset=32
      local.get 2
      i32.const 3
      i32.store offset=28
      local.get 2
      local.get 1
      i32.store offset=24
      local.get 2
      local.get 2
      i32.const 24
      i32.add
      local.tee 1
      i32.store offset=8
      local.get 3
      local.get 5
      local.get 2
      call 60
      br_if 0 (;@1;)
      local.get 3
      i32.const 67396
      i32.const 2
      local.get 6
      call_indirect (type 0)
      br_if 0 (;@1;)
      local.get 2
      i32.const 32
      i32.add
      local.get 4
      i32.load
      local.tee 0
      i32.const 8
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      i32.const 40
      i32.add
      local.get 0
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      local.get 0
      i64.load align=4
      i64.store offset=24
      local.get 3
      local.get 5
      local.get 1
      call 60
      local.set 0
    end
    local.get 2
    i32.const 48
    i32.add
    global.set 0
    local.get 0)
  (table (;0;) 14 14 funcref)
  (global (;0;) (mut i32) (i32.const 65536))
  (global (;1;) i32 (i32.const 85120))
  (global (;2;) i32 (i32.const 85106))
  (export "call" (func 35))
  (export "deploy" (func 39))
  (elem (;0;) (i32.const 1) func 21 56 57 58 24 18 61 17 48 45 46 47 27)
  (data (;0;) (i32.const 65536) "/Users/kevinvalerio/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/parity-scale-codec-3.7.0/src/compact.rs\00\00\01\00p\00\00\00I\00\00\00 \00\00\00/Users/kevinvalerio/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/parity-scale-codec-3.7.0/src/codec.rs\00\00\80\00\01\00n\00\00\00\92\04\00\00\1e\00\00\00\80\00\01\00n\00\00\00l\04\00\00\0f\00\00\00\b0\0b\01\00u\00\00\00-\00\00\00\14\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\08\00\00\00/Users/kevinvalerio/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/ink_env-5.0.0/src/engine/on_chain/impls.rs\000\01\01\00s\00\00\00\1a\01\00\002\00\00\00encountered unexpected error\b4\01\01\00\1c\00\00\000\01\01\00s\00\00\00\e3\00\00\00\17\00\00\00/Users/kevinvalerio/Desktop/research/phink/toooooooooooz/lib.rs\00\e8\01\01\00?\00\00\00\0d\00\00\00\05\00\00\00storage entry was empty\008\02\01\00\17\00\00\00could not properly decode storage entry\00X\02\01\00'\00\00\00COV=0\00\00\00\88\02\01\00\05\00\00\00COV=1\00\00\00\98\02\01\00\05\00\00\00COV=2\00\00\00\a8\02\01\00\05\00\00\00\e8\01\01\00?\00\00\00!\00\00\00(\00\00\00COV=3\00\00\00\c8\02\01\00\05\00\00\00\e8\01\01\00?\00\00\00#\00\00\00,\00\00\00COV=4\00\00\00\e8\02\01\00\05\00\00\00\e8\01\01\00?\00\00\00%\00\00\000\00\00\00COV=5\00\00\00\08\03\01\00\05\00\00\00\e8\01\01\00?\00\00\00'\00\00\004\00\00\00COV=6\00\00\00(\03\01\00\05\00\00\00COV=7\00\00\008\03\01\00\05\00\00\00COV=8\00\00\00H\03\01\00\05\00\00\00COV=9\00\00\00X\03\01\00\05\00\00\00\e8\01\01\00?\00\00\00<\00\00\00\0d")
  (data (;1;) (i32.const 66432) "\01\00\00\00\09\00\00\00Error\00\00\00\0a\00\00\00\0c\00\00\00\04\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00capacity overflow\00\00\00\a8\03\01\00\11\00\00\00/Users/kevinvalerio/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/alloc/src/raw_vec.rs\00\00\00\c4\03\01\00u\00\00\00*\02\00\00\11\00\00\00/Users/kevinvalerio/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/alloc/src/alloc.rsmemory allocation of  bytes failed\00\00\00\bf\04\01\00\15\00\00\00\d4\04\01\00\0d\00\00\00L\04\01\00s\00\00\00\b6\01\00\00\0d\00\00\00a formatting trait implementation returned an error when the underlying stream did not/Users/kevinvalerio/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/alloc/src/fmt.rs\00Z\05\01\00q\00\00\00\8a\02\00\00\0e\00\00\00/Users/kevinvalerio/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/alloc/src/slice.rs\00\dc\05\01\00s\00\00\00\a2\00\00\00\19\00\00\00/Users/kevinvalerio/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/src/rust/library/alloc/src/string.rs`\06\01\00t\00\00\00\ea\01\00\00\17\00\00\00`\06\01\00t\00\00\00\8d\05\00\00\1b\00\00\00:called `Option::unwrap()` on a `None` value\01\00\00\00\00\00\00\00\f4\06\01\00\01\00\00\00\f4\06\01\00\01\00\00\00panicked at :\0aindex out of bounds: the len is  but the index is F\07\01\00 \00\00\00f\07\01\00\12\00\00\00!=assertion `left  right` failed\0a  left: \0a right: \00\00\8a\07\01\00\10\00\00\00\9a\07\01\00\17\00\00\00\b1\07\01\00\09\00\00\00 right` failed: \0a  left: \00\00\00\8a\07\01\00\10\00\00\00\d4\07\01\00\10\00\00\00\e4\07\01\00\09\00\00\00\b1\07\01\00\09\00\00\00: \00\00\01\00\00\00\00\00\00\00\10\08\01\00\02\00\00\000x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01")
  (data (;2;) (i32.const 68016) "\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04")
  (data (;3;) (i32.const 68078) "range start index  out of range for slice of length \00\00\ee\09\01\00\12\00\00\00\00\0a\01\00\22\00\00\00range end index 4\0a\01\00\10\00\00\00\00\0a\01\00\22\00\00\00\01\00\00\00\00\00\00\00unable to decode selectorencountered unknown selectorunable to decode inputcould not read inputpaid an unpayable messagemid > len\00\00\00\d4\0a\01\00\09\00\00\00\0a\00\00\00\01\00\00\00\00\00\00\00\e8\0a\01\00\01\00\00\00/Users/kevinvalerio/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/ink_env-5.0.0/src/engine/on_chain/buffer.rs\fc\0a\01\00t\00\00\00\5c\00\00\00;\00\00\00\fc\0a\01\00t\00\00\00\5c\00\00\00\14\00\00\00\fc\0a\01\00t\00\00\00h\00\00\00\09\00\00\00\fc\0a\01\00t\00\00\00\90\00\00\00!\00\00\00/Users/kevinvalerio/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/pallet-contracts-uapi-next-6.0.3/src/host.rs\00\00\00\b0\0b\01\00u\00\00\00-\00\00\00\17\00\00\00\19\00\00\00\1c\00\00\00\16\00\00\00\14\00\00\00\19\00\00\00\5c\0a\01\00u\0a\01\00\91\0a\01\00\a7\0a\01\00\bb\0a\01"))
