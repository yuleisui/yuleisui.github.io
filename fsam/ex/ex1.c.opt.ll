; ModuleID = './tt1.c.opt'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_attr_t = type { i64, [48 x i8] }

@x = common global i32* null, align 8
@p = global i32** @x, align 8
@y = common global i32 0, align 4
@q = global i32* @y, align 8
@z = common global i32 0, align 4
@r = global i32* @z, align 8
@c = common global i32* null, align 8

; Function Attrs: nounwind uwtable
define i8* @foo(i8* %ignored) #0 {
entry:
  call void @llvm.dbg.value(metadata !{i8* %ignored}, i64 0, metadata !27), !dbg !28
  %0 = load i32** @q, align 8, !dbg !29
  %1 = load i32*** @p, align 8, !dbg !29
  store i32* %0, i32** %1, align 8, !dbg !29
  ret i8* null, !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %t = alloca i64, align 8
  call void @llvm.dbg.declare(metadata !{i64* %t}, metadata !31), !dbg !35
  %call = call i32 @pthread_create(i64* %t, %union.pthread_attr_t* null, i8* (i8*)* @foo, i8* null) #3, !dbg !36
  %0 = load i32** @r, align 8, !dbg !37
  %1 = load i32*** @p, align 8, !dbg !37
  store i32* %0, i32** %1, align 8, !dbg !37
  %2 = load i32*** @p, align 8, !dbg !38
  %3 = load i32** %2, align 8, !dbg !38
  store i32* %3, i32** @c, align 8, !dbg !38
  ret i32 0, !dbg !39
}

; Function Attrs: nounwind
declare i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !14, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/ysui/fig1tests/tt1.c] [DW_LANG_C99]
!1 = metadata !{metadata !"tt1.c", metadata !"/home/ysui/fig1tests"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"foo", metadata !"foo", metadata !"", i32 9, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*)* @foo, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [foo]
!5 = metadata !{metadata !"./tt1.c", metadata !"/home/ysui/fig1tests"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/ysui/fig1tests/./tt1.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"main", metadata !"main", metadata !"", i32 14, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 14] [def] [main]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{metadata !15, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23}
!15 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !6, i32 5, metadata !16, i32 0, i32 1, i32*** @p, null} ; [ DW_TAG_variable ] [p] [line 5] [def]
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!18 = metadata !{i32 786484, i32 0, null, metadata !"q", metadata !"q", metadata !"", metadata !6, i32 5, metadata !17, i32 0, i32 1, i32** @q, null} ; [ DW_TAG_variable ] [q] [line 5] [def]
!19 = metadata !{i32 786484, i32 0, null, metadata !"r", metadata !"r", metadata !"", metadata !6, i32 5, metadata !17, i32 0, i32 1, i32** @r, null} ; [ DW_TAG_variable ] [r] [line 5] [def]
!20 = metadata !{i32 786484, i32 0, null, metadata !"x", metadata !"x", metadata !"", metadata !6, i32 4, metadata !17, i32 0, i32 1, i32** @x, null} ; [ DW_TAG_variable ] [x] [line 4] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"y", metadata !"y", metadata !"", metadata !6, i32 4, metadata !13, i32 0, i32 1, i32* @y, null} ; [ DW_TAG_variable ] [y] [line 4] [def]
!22 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !6, i32 4, metadata !13, i32 0, i32 1, i32* @z, null} ; [ DW_TAG_variable ] [z] [line 4] [def]
!23 = metadata !{i32 786484, i32 0, null, metadata !"c", metadata !"c", metadata !"", metadata !6, i32 7, metadata !17, i32 0, i32 1, i32** @c, null} ; [ DW_TAG_variable ] [c] [line 7] [def]
!24 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!25 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!26 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!27 = metadata !{i32 786689, metadata !4, metadata !"ignored", metadata !6, i32 16777225, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ignored] [line 9]
!28 = metadata !{i32 9, i32 17, metadata !4, null}
!29 = metadata !{i32 10, i32 1, metadata !4, null}
!30 = metadata !{i32 11, i32 1, metadata !4, null}
!31 = metadata !{i32 786688, metadata !10, metadata !"t", metadata !6, i32 15, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 15]
!32 = metadata !{i32 786454, metadata !33, null, metadata !"pthread_t", i32 60, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ] [pthread_t] [line 60, size 0, align 0, offset 0] [from long unsigned int]
!33 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", metadata !"/home/ysui/fig1tests"}
!34 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!35 = metadata !{i32 15, i32 11, metadata !10, null}
!36 = metadata !{i32 16, i32 1, metadata !10, null}
!37 = metadata !{i32 17, i32 1, metadata !10, null}
!38 = metadata !{i32 18, i32 1, metadata !10, null}
!39 = metadata !{i32 19, i32 1, metadata !10, null}
