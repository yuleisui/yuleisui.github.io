; ModuleID = './tt5.c.opt'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.pthread_attr_t = type { i64, [48 x i8] }

@x = common global i32* null, align 8
@p = global i32** @x, align 8
@y = common global i32 0, align 4
@q = global i32* @y, align 8
@z = common global i32 0, align 4
@r = global i32* @z, align 8
@mtx = common global %union.pthread_mutex_t zeroinitializer, align 8
@c = common global i32* null, align 8

; Function Attrs: nounwind uwtable
define i8* @foo(i8* %ignored) #0 {
entry:
  call void @llvm.dbg.value(metadata !{i8* %ignored}, i64 0, metadata !58), !dbg !59
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @mtx) #3, !dbg !60
  %0 = load i32** @r, align 8, !dbg !61
  %1 = load i32*** @p, align 8, !dbg !61
  store i32* %0, i32** %1, align 8, !dbg !61
  %2 = load i32** @q, align 8, !dbg !62
  %3 = load i32*** @p, align 8, !dbg !62
  store i32* %2, i32** %3, align 8, !dbg !62
  %call1 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @mtx) #3, !dbg !63
  ret i8* null, !dbg !64
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #2

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %t = alloca i64, align 8
  call void @llvm.dbg.declare(metadata !{i64* %t}, metadata !65), !dbg !68
  %call = call i32 @pthread_create(i64* %t, %union.pthread_attr_t* null, i8* (i8*)* @foo, i8* null) #3, !dbg !69
  %call1 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @mtx) #3, !dbg !70
  %0 = load i32*** @p, align 8, !dbg !71
  %1 = load i32** %0, align 8, !dbg !71
  store i32* %1, i32** @c, align 8, !dbg !71
  %call2 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @mtx) #3, !dbg !72
  ret i32 0, !dbg !73
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
!llvm.module.flags = !{!55, !56}
!llvm.ident = !{!57}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !14, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/ysui/fig1tests/tt5.c] [DW_LANG_C99]
!1 = metadata !{metadata !"tt5.c", metadata !"/home/ysui/fig1tests"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"foo", metadata !"foo", metadata !"", i32 9, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*)* @foo, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [foo]
!5 = metadata !{metadata !"./tt5.c", metadata !"/home/ysui/fig1tests"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/ysui/fig1tests/./tt5.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !2, i32 17} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{metadata !15, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24}
!15 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !6, i32 4, metadata !16, i32 0, i32 1, i32*** @p, null} ; [ DW_TAG_variable ] [p] [line 4] [def]
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!18 = metadata !{i32 786484, i32 0, null, metadata !"q", metadata !"q", metadata !"", metadata !6, i32 4, metadata !17, i32 0, i32 1, i32** @q, null} ; [ DW_TAG_variable ] [q] [line 4] [def]
!19 = metadata !{i32 786484, i32 0, null, metadata !"r", metadata !"r", metadata !"", metadata !6, i32 4, metadata !17, i32 0, i32 1, i32** @r, null} ; [ DW_TAG_variable ] [r] [line 4] [def]
!20 = metadata !{i32 786484, i32 0, null, metadata !"x", metadata !"x", metadata !"", metadata !6, i32 3, metadata !17, i32 0, i32 1, i32** @x, null} ; [ DW_TAG_variable ] [x] [line 3] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"y", metadata !"y", metadata !"", metadata !6, i32 3, metadata !13, i32 0, i32 1, i32* @y, null} ; [ DW_TAG_variable ] [y] [line 3] [def]
!22 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !6, i32 3, metadata !13, i32 0, i32 1, i32* @z, null} ; [ DW_TAG_variable ] [z] [line 3] [def]
!23 = metadata !{i32 786484, i32 0, null, metadata !"c", metadata !"c", metadata !"", metadata !6, i32 6, metadata !17, i32 0, i32 1, i32** @c, null} ; [ DW_TAG_variable ] [c] [line 6] [def]
!24 = metadata !{i32 786484, i32 0, null, metadata !"mtx", metadata !"mtx", metadata !"", metadata !6, i32 7, metadata !25, i32 0, i32 1, %union.pthread_mutex_t* @mtx, null} ; [ DW_TAG_variable ] [mtx] [line 7] [def]
!25 = metadata !{i32 786454, metadata !26, null, metadata !"pthread_mutex_t", i32 127, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [pthread_mutex_t] [line 127, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", metadata !"/home/ysui/fig1tests"}
!27 = metadata !{i32 786455, metadata !26, null, metadata !"", i32 90, i64 320, i64 64, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 90, size 320, align 64, offset 0] [def] [from ]
!28 = metadata !{metadata !29, metadata !48, metadata !53}
!29 = metadata !{i32 786445, metadata !26, metadata !27, metadata !"__data", i32 124, i64 320, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [__data] [line 124, size 320, align 64, offset 0] [from __pthread_mutex_s]
!30 = metadata !{i32 786451, metadata !26, null, metadata !"__pthread_mutex_s", i32 92, i64 320, i64 64, i32 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__pthread_mutex_s] [line 92, size 320, align 64, offset 0] [def] [from ]
!31 = metadata !{metadata !32, metadata !33, metadata !35, metadata !36, metadata !37, metadata !38, metadata !40, metadata !41}
!32 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__lock", i32 94, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [__lock] [line 94, size 32, align 32, offset 0] [from int]
!33 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__count", i32 95, i64 32, i64 32, i64 32, i32 0, metadata !34} ; [ DW_TAG_member ] [__count] [line 95, size 32, align 32, offset 32] [from unsigned int]
!34 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!35 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__owner", i32 96, i64 32, i64 32, i64 64, i32 0, metadata !13} ; [ DW_TAG_member ] [__owner] [line 96, size 32, align 32, offset 64] [from int]
!36 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__nusers", i32 98, i64 32, i64 32, i64 96, i32 0, metadata !34} ; [ DW_TAG_member ] [__nusers] [line 98, size 32, align 32, offset 96] [from unsigned int]
!37 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__kind", i32 102, i64 32, i64 32, i64 128, i32 0, metadata !13} ; [ DW_TAG_member ] [__kind] [line 102, size 32, align 32, offset 128] [from int]
!38 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__spins", i32 104, i64 16, i64 16, i64 160, i32 0, metadata !39} ; [ DW_TAG_member ] [__spins] [line 104, size 16, align 16, offset 160] [from short]
!39 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!40 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__elision", i32 105, i64 16, i64 16, i64 176, i32 0, metadata !39} ; [ DW_TAG_member ] [__elision] [line 105, size 16, align 16, offset 176] [from short]
!41 = metadata !{i32 786445, metadata !26, metadata !30, metadata !"__list", i32 106, i64 128, i64 64, i64 192, i32 0, metadata !42} ; [ DW_TAG_member ] [__list] [line 106, size 128, align 64, offset 192] [from __pthread_list_t]
!42 = metadata !{i32 786454, metadata !26, null, metadata !"__pthread_list_t", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__pthread_list_t] [line 79, size 0, align 0, offset 0] [from __pthread_internal_list]
!43 = metadata !{i32 786451, metadata !26, null, metadata !"__pthread_internal_list", i32 75, i64 128, i64 64, i32 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__pthread_internal_list] [line 75, size 128, align 64, offset 0] [def] [from ]
!44 = metadata !{metadata !45, metadata !47}
!45 = metadata !{i32 786445, metadata !26, metadata !43, metadata !"__prev", i32 77, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_member ] [__prev] [line 77, size 64, align 64, offset 0] [from ]
!46 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __pthread_internal_list]
!47 = metadata !{i32 786445, metadata !26, metadata !43, metadata !"__next", i32 78, i64 64, i64 64, i64 64, i32 0, metadata !46} ; [ DW_TAG_member ] [__next] [line 78, size 64, align 64, offset 64] [from ]
!48 = metadata !{i32 786445, metadata !26, metadata !27, metadata !"__size", i32 125, i64 320, i64 8, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ] [__size] [line 125, size 320, align 8, offset 0] [from ]
!49 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 8, i32 0, i32 0, metadata !50, metadata !51, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 8, offset 0] [from char]
!50 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!51 = metadata !{metadata !52}
!52 = metadata !{i32 786465, i64 0, i64 40}       ; [ DW_TAG_subrange_type ] [0, 39]
!53 = metadata !{i32 786445, metadata !26, metadata !27, metadata !"__align", i32 126, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_member ] [__align] [line 126, size 64, align 64, offset 0] [from long int]
!54 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!55 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!56 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!57 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!58 = metadata !{i32 786689, metadata !4, metadata !"ignored", metadata !6, i32 16777225, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ignored] [line 9]
!59 = metadata !{i32 9, i32 17, metadata !4, null}
!60 = metadata !{i32 10, i32 1, metadata !4, null}
!61 = metadata !{i32 11, i32 1, metadata !4, null}
!62 = metadata !{i32 12, i32 1, metadata !4, null}
!63 = metadata !{i32 13, i32 1, metadata !4, null}
!64 = metadata !{i32 14, i32 1, metadata !4, null}
!65 = metadata !{i32 786688, metadata !10, metadata !"t", metadata !6, i32 18, metadata !66, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 18]
!66 = metadata !{i32 786454, metadata !26, null, metadata !"pthread_t", i32 60, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [pthread_t] [line 60, size 0, align 0, offset 0] [from long unsigned int]
!67 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!68 = metadata !{i32 18, i32 11, metadata !10, null}
!69 = metadata !{i32 19, i32 1, metadata !10, null}
!70 = metadata !{i32 20, i32 1, metadata !10, null}
!71 = metadata !{i32 21, i32 1, metadata !10, null}
!72 = metadata !{i32 22, i32 1, metadata !10, null}
!73 = metadata !{i32 23, i32 1, metadata !10, null}
