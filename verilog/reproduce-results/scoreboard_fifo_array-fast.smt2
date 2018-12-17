(set-logic QF_ABV)
(declare-fun rst_AT0 () (_ BitVec 1))
(declare-fun prop_signal_AT0 () (_ BitVec 1))
(declare-fun f.entries_AT0 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun data_out_vld_AT0 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT0 () (_ BitVec 8))
(declare-fun pop_AT0 () (_ BitVec 1))
(declare-fun push_AT0 () (_ BitVec 1))
(declare-fun mpt.ff_cnt.Q_AT0 () (_ BitVec 4))
(declare-fun ff_en.Q_AT0 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT0 () (_ BitVec 4))
(declare-fun f.ff_rdPtr.Q_AT0 () (_ BitVec 4))

(assert (= (bvor push_AT0 pop_AT0) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT0) ((_ extract 2 0) f.ff_wrPtr.Q_AT0)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT0) ((_ extract 3 3) f.ff_wrPtr.Q_AT0))))) (bvnot push_AT0)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT0 f.ff_wrPtr.Q_AT0)) (bvnot pop_AT0)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT0) (bvnot #b1)) #b1))
(assert (= prop_signal_AT0 (bvor (bvnot (bvand (bvand ff_en.Q_AT0 (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT0 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0) #b0000)) pop_AT0) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0))) #b0000))))) (bvcomp ff_magic_packet.Q_AT0 (select f.entries_AT0 ((_ extract 2 0) f.ff_rdPtr.Q_AT0))))))
(assert (= data_out_vld_AT0 (bvand (bvand ff_en.Q_AT0 (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT0 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0) #b0000)) pop_AT0) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT0 (bvadd f.ff_rdPtr.Q_AT0 mpt.ff_cnt.Q_AT0)))
(assert (bvule mpt.ff_cnt.Q_AT0 #b1000))
(assert (= ff_en.Q_AT0 #b0))
(push 1)

(assert (= prop_signal_AT0 #b0))
(echo |checking property at 0|)
(check-sat)

(pop 1)
(declare-fun f.ff_wrPtr.Q_AT1 () (_ BitVec 4))
(declare-fun flat_data_in_AT0 () (_ BitVec 8))
(declare-fun f.entries_AT1 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT1 () (_ BitVec 4))
(declare-fun start_AT0 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT1 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT1 () (_ BitVec 4))
(declare-fun ff_en.Q_AT1 () (_ BitVec 1))
(declare-fun pop_AT1 () (_ BitVec 1))
(declare-fun push_AT1 () (_ BitVec 1))
(declare-fun rst_AT1 () (_ BitVec 1))
(declare-fun prop_signal_AT1 () (_ BitVec 1))
(declare-fun data_out_vld_AT1 () (_ BitVec 1))

(assert (= (bvor push_AT1 pop_AT1) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT1) ((_ extract 2 0) f.ff_wrPtr.Q_AT1)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT1) ((_ extract 3 3) f.ff_wrPtr.Q_AT1))))) (bvnot push_AT1)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT1 f.ff_wrPtr.Q_AT1)) (bvnot pop_AT1)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT1) (bvnot #b1)) #b1))
(assert (= prop_signal_AT1 (bvor (bvnot (bvand (bvand ff_en.Q_AT1 (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT1 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1) #b0000)) pop_AT1) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1))) #b0000))))) (bvcomp ff_magic_packet.Q_AT1 (select f.entries_AT1 ((_ extract 2 0) f.ff_rdPtr.Q_AT1))))))
(assert (= data_out_vld_AT1 (bvand (bvand ff_en.Q_AT1 (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT1 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1) #b0000)) pop_AT1) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT1 (bvite (bvcomp rst_AT0 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT0 pop_AT0) rst_AT0) #b1) (bvite (bvcomp push_AT0 #b1) (bvadd f.ff_wrPtr.Q_AT0 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT0) f.ff_wrPtr.Q_AT0))))
(assert (= f.entries_AT1 (store f.entries_AT0 ((_ extract 2 0) f.ff_wrPtr.Q_AT0) (bvite (bvnot (bvcomp (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (bvite (bvcomp push_AT0 #b1) #b1 #b0)))))))) #b00000000)) (bvor (bvand flat_data_in_AT0 (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (bvite (bvcomp push_AT0 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT0 ((_ extract 2 0) f.ff_wrPtr.Q_AT0)) (bvnot (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT0 #b1) #b1 #b0) (bvite (bvcomp push_AT0 #b1) #b1 #b0))))))))))) (select f.entries_AT0 ((_ extract 2 0) f.ff_wrPtr.Q_AT0))))))
(assert (= f.ff_rdPtr.Q_AT1 (bvite (bvcomp rst_AT0 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT0 pop_AT0) rst_AT0) #b1) (bvite (bvcomp pop_AT0 #b1) (bvadd f.ff_rdPtr.Q_AT0 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT0) f.ff_rdPtr.Q_AT0))))
(assert (= ff_magic_packet.Q_AT1 (bvite (bvcomp rst_AT0 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT0 push_AT0) (bvnot ff_en.Q_AT0)) #b1) flat_data_in_AT0 ff_magic_packet.Q_AT0))))
(assert (= mpt.ff_cnt.Q_AT1 (bvite (bvcomp rst_AT0 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT0 pop_AT0) rst_AT0) ff_en.Q_AT0) #b1) (bvite (bvcomp rst_AT0 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0) #b0000)) pop_AT0) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT0 #b1000)) push_AT0) (bvnot ff_en.Q_AT0)) #b1) (bvadd mpt.ff_cnt.Q_AT0 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT0))) mpt.ff_cnt.Q_AT0))))
(assert (= ff_en.Q_AT1 (bvite (bvcomp rst_AT0 #b1) #b0 (bvite (bvcomp ff_en.Q_AT0 #b1) #b1 (bvor ff_en.Q_AT0 (bvand start_AT0 push_AT0))))))
(push 1)

(assert (= prop_signal_AT1 #b0))


(declare-const en_AT1_prop_AT1 Bool)
(assert (= en_AT1_prop_AT1 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT1 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT1))))))

(declare-const temporal_splits_AT1 Bool)
(assert (= temporal_splits_AT1 en_AT1_prop_AT1))
(check-sat-assuming ( (not temporal_splits_AT1) ))
;; END

(echo |checking property at 1|)
(check-sat)

(pop 1)
(declare-fun f.ff_wrPtr.Q_AT2 () (_ BitVec 4))
(declare-fun flat_data_in_AT1 () (_ BitVec 8))
(declare-fun f.entries_AT2 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT2 () (_ BitVec 4))
(declare-fun start_AT1 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT2 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT2 () (_ BitVec 4))
(declare-fun ff_en.Q_AT2 () (_ BitVec 1))
(declare-fun pop_AT2 () (_ BitVec 1))
(declare-fun push_AT2 () (_ BitVec 1))
(declare-fun rst_AT2 () (_ BitVec 1))
(declare-fun prop_signal_AT2 () (_ BitVec 1))
(declare-fun data_out_vld_AT2 () (_ BitVec 1))

(assert (= (bvor push_AT2 pop_AT2) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT2) ((_ extract 2 0) f.ff_wrPtr.Q_AT2)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT2) ((_ extract 3 3) f.ff_wrPtr.Q_AT2))))) (bvnot push_AT2)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT2 f.ff_wrPtr.Q_AT2)) (bvnot pop_AT2)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT2) (bvnot #b1)) #b1))
(assert (= prop_signal_AT2 (bvor (bvnot (bvand (bvand ff_en.Q_AT2 (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT2 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2) #b0000)) pop_AT2) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2))) #b0000))))) (bvcomp ff_magic_packet.Q_AT2 (select f.entries_AT2 ((_ extract 2 0) f.ff_rdPtr.Q_AT2))))))
(assert (= data_out_vld_AT2 (bvand (bvand ff_en.Q_AT2 (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT2 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2) #b0000)) pop_AT2) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT2 (bvite (bvcomp rst_AT1 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT1 pop_AT1) rst_AT1) #b1) (bvite (bvcomp push_AT1 #b1) (bvadd f.ff_wrPtr.Q_AT1 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT1) f.ff_wrPtr.Q_AT1))))
(assert (= f.entries_AT2 (store f.entries_AT1 ((_ extract 2 0) f.ff_wrPtr.Q_AT1) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (bvite (bvcomp push_AT1 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT1 (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (bvite (bvcomp push_AT1 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT1 ((_ extract 2 0) f.ff_wrPtr.Q_AT1)) (bvnot (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT1 #b1) #b1 #b0) (bvite (bvcomp push_AT1 #b1) #b1 #b0))))))))))) (select f.entries_AT1 ((_ extract 2 0) f.ff_wrPtr.Q_AT1))))))
(assert (= f.ff_rdPtr.Q_AT2 (bvite (bvcomp rst_AT1 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT1 pop_AT1) rst_AT1) #b1) (bvite (bvcomp pop_AT1 #b1) (bvadd f.ff_rdPtr.Q_AT1 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT1) f.ff_rdPtr.Q_AT1))))
(assert (= ff_magic_packet.Q_AT2 (bvite (bvcomp rst_AT1 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT1 push_AT1) (bvnot ff_en.Q_AT1)) #b1) flat_data_in_AT1 ff_magic_packet.Q_AT1))))
(assert (= mpt.ff_cnt.Q_AT2 (bvite (bvcomp rst_AT1 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT1 pop_AT1) rst_AT1) ff_en.Q_AT1) #b1) (bvite (bvcomp rst_AT1 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1) #b0000)) pop_AT1) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT1 #b1000)) push_AT1) (bvnot ff_en.Q_AT1)) #b1) (bvadd mpt.ff_cnt.Q_AT1 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT1))) mpt.ff_cnt.Q_AT1))))
(assert (= ff_en.Q_AT2 (bvite (bvcomp rst_AT1 #b1) #b0 (bvite (bvcomp ff_en.Q_AT1 #b1) #b1 (bvor ff_en.Q_AT1 (bvand start_AT1 push_AT1))))))
(push 1)

(assert (= prop_signal_AT2 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT2 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT2 Bool)
(assert (= en_AT1_prop_AT2 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT2 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT2))))))

(declare-const en_AT2_prop_AT2 Bool)
(assert (= en_AT2_prop_AT2 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT2 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT2))))))

(declare-const temporal_splits_AT2 Bool)
(assert (= temporal_splits_AT2 (and en_AT1_prop_AT2 en_AT2_prop_AT2)))
(check-sat-assuming ( (not temporal_splits_AT2) ))
;; END

(echo |checking property at 2|)
(check-sat)

(pop 1)
(declare-fun flat_data_in_AT2 () (_ BitVec 8))
(declare-fun f.entries_AT3 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT3 () (_ BitVec 4))
(declare-fun start_AT2 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT3 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT3 () (_ BitVec 4))
(declare-fun ff_en.Q_AT3 () (_ BitVec 1))
(declare-fun pop_AT3 () (_ BitVec 1))
(declare-fun push_AT3 () (_ BitVec 1))
(declare-fun rst_AT3 () (_ BitVec 1))
(declare-fun prop_signal_AT3 () (_ BitVec 1))
(declare-fun data_out_vld_AT3 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT3 () (_ BitVec 4))

(assert (= (bvor push_AT3 pop_AT3) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT3) ((_ extract 2 0) f.ff_wrPtr.Q_AT3)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT3) ((_ extract 3 3) f.ff_wrPtr.Q_AT3))))) (bvnot push_AT3)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT3 f.ff_wrPtr.Q_AT3)) (bvnot pop_AT3)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT3) (bvnot #b1)) #b1))
(assert (= prop_signal_AT3 (bvor (bvnot (bvand (bvand ff_en.Q_AT3 (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT3 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3) #b0000)) pop_AT3) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3))) #b0000))))) (bvcomp ff_magic_packet.Q_AT3 (select f.entries_AT3 ((_ extract 2 0) f.ff_rdPtr.Q_AT3))))))
(assert (= data_out_vld_AT3 (bvand (bvand ff_en.Q_AT3 (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT3 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3) #b0000)) pop_AT3) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT3 (bvite (bvcomp rst_AT2 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT2 pop_AT2) rst_AT2) #b1) (bvite (bvcomp push_AT2 #b1) (bvadd f.ff_wrPtr.Q_AT2 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT2) f.ff_wrPtr.Q_AT2))))
(assert (= f.entries_AT3 (store f.entries_AT2 ((_ extract 2 0) f.ff_wrPtr.Q_AT2) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (bvite (bvcomp push_AT2 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT2 (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (bvite (bvcomp push_AT2 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT2 ((_ extract 2 0) f.ff_wrPtr.Q_AT2)) (bvnot (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT2 #b1) #b1 #b0) (bvite (bvcomp push_AT2 #b1) #b1 #b0))))))))))) (select f.entries_AT2 ((_ extract 2 0) f.ff_wrPtr.Q_AT2))))))
(assert (= f.ff_rdPtr.Q_AT3 (bvite (bvcomp rst_AT2 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT2 pop_AT2) rst_AT2) #b1) (bvite (bvcomp pop_AT2 #b1) (bvadd f.ff_rdPtr.Q_AT2 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT2) f.ff_rdPtr.Q_AT2))))
(assert (= ff_magic_packet.Q_AT3 (bvite (bvcomp rst_AT2 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT2 push_AT2) (bvnot ff_en.Q_AT2)) #b1) flat_data_in_AT2 ff_magic_packet.Q_AT2))))
(assert (= mpt.ff_cnt.Q_AT3 (bvite (bvcomp rst_AT2 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT2 pop_AT2) rst_AT2) ff_en.Q_AT2) #b1) (bvite (bvcomp rst_AT2 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2) #b0000)) pop_AT2) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT2 #b1000)) push_AT2) (bvnot ff_en.Q_AT2)) #b1) (bvadd mpt.ff_cnt.Q_AT2 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT2))) mpt.ff_cnt.Q_AT2))))
(assert (= ff_en.Q_AT3 (bvite (bvcomp rst_AT2 #b1) #b0 (bvite (bvcomp ff_en.Q_AT2 #b1) #b1 (bvor ff_en.Q_AT2 (bvand start_AT2 push_AT2))))))
(push 1)

(assert (= prop_signal_AT3 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT3 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT3 Bool)
(assert (= en_AT1_prop_AT3 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT3 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT3))))))

(declare-const en_AT2_prop_AT3 Bool)
(assert (= en_AT2_prop_AT3 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT3 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT3))))))

(declare-const en_AT3_prop_AT3 Bool)
(assert (= en_AT3_prop_AT3 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT3 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT3))))))

(declare-const temporal_splits_AT3 Bool)
(assert (= temporal_splits_AT3 (and en_AT1_prop_AT3 en_AT2_prop_AT3 en_AT3_prop_AT3)))
(check-sat-assuming ( (not temporal_splits_AT3) ))
;; END

(echo |checking property at 3|)
(check-sat)

(pop 1)
(declare-fun flat_data_in_AT3 () (_ BitVec 8))
(declare-fun f.entries_AT4 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT4 () (_ BitVec 4))
(declare-fun start_AT3 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT4 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT4 () (_ BitVec 4))
(declare-fun ff_en.Q_AT4 () (_ BitVec 1))
(declare-fun pop_AT4 () (_ BitVec 1))
(declare-fun push_AT4 () (_ BitVec 1))
(declare-fun rst_AT4 () (_ BitVec 1))
(declare-fun prop_signal_AT4 () (_ BitVec 1))
(declare-fun data_out_vld_AT4 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT4 () (_ BitVec 4))

(assert (= (bvor push_AT4 pop_AT4) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT4) ((_ extract 2 0) f.ff_wrPtr.Q_AT4)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT4) ((_ extract 3 3) f.ff_wrPtr.Q_AT4))))) (bvnot push_AT4)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT4 f.ff_wrPtr.Q_AT4)) (bvnot pop_AT4)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT4) (bvnot #b1)) #b1))
(assert (= prop_signal_AT4 (bvor (bvnot (bvand (bvand ff_en.Q_AT4 (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT4 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4) #b0000)) pop_AT4) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4))) #b0000))))) (bvcomp ff_magic_packet.Q_AT4 (select f.entries_AT4 ((_ extract 2 0) f.ff_rdPtr.Q_AT4))))))
(assert (= data_out_vld_AT4 (bvand (bvand ff_en.Q_AT4 (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT4 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4) #b0000)) pop_AT4) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT4 (bvite (bvcomp rst_AT3 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT3 pop_AT3) rst_AT3) #b1) (bvite (bvcomp push_AT3 #b1) (bvadd f.ff_wrPtr.Q_AT3 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT3) f.ff_wrPtr.Q_AT3))))
(assert (= f.entries_AT4 (store f.entries_AT3 ((_ extract 2 0) f.ff_wrPtr.Q_AT3) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (bvite (bvcomp push_AT3 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT3 (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (bvite (bvcomp push_AT3 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT3 ((_ extract 2 0) f.ff_wrPtr.Q_AT3)) (bvnot (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT3 #b1) #b1 #b0) (bvite (bvcomp push_AT3 #b1) #b1 #b0))))))))))) (select f.entries_AT3 ((_ extract 2 0) f.ff_wrPtr.Q_AT3))))))
(assert (= f.ff_rdPtr.Q_AT4 (bvite (bvcomp rst_AT3 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT3 pop_AT3) rst_AT3) #b1) (bvite (bvcomp pop_AT3 #b1) (bvadd f.ff_rdPtr.Q_AT3 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT3) f.ff_rdPtr.Q_AT3))))
(assert (= ff_magic_packet.Q_AT4 (bvite (bvcomp rst_AT3 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT3 push_AT3) (bvnot ff_en.Q_AT3)) #b1) flat_data_in_AT3 ff_magic_packet.Q_AT3))))
(assert (= mpt.ff_cnt.Q_AT4 (bvite (bvcomp rst_AT3 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT3 pop_AT3) rst_AT3) ff_en.Q_AT3) #b1) (bvite (bvcomp rst_AT3 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3) #b0000)) pop_AT3) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT3 #b1000)) push_AT3) (bvnot ff_en.Q_AT3)) #b1) (bvadd mpt.ff_cnt.Q_AT3 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT3))) mpt.ff_cnt.Q_AT3))))
(assert (= ff_en.Q_AT4 (bvite (bvcomp rst_AT3 #b1) #b0 (bvite (bvcomp ff_en.Q_AT3 #b1) #b1 (bvor ff_en.Q_AT3 (bvand start_AT3 push_AT3))))))
(push 1)

(assert (= prop_signal_AT4 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT4 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT4 Bool)
(assert (= en_AT1_prop_AT4 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT4 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT4))))))

(declare-const en_AT2_prop_AT4 Bool)
(assert (= en_AT2_prop_AT4 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT4 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT4))))))

(declare-const en_AT3_prop_AT4 Bool)
(assert (= en_AT3_prop_AT4 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT4 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT4))))))

(declare-const en_AT4_prop_AT4 Bool)
(assert (= en_AT4_prop_AT4 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT4 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT4))))))

(declare-const temporal_splits_AT4 Bool)
(assert (= temporal_splits_AT4 (and en_AT1_prop_AT4 en_AT2_prop_AT4 en_AT3_prop_AT4 en_AT4_prop_AT4)))
(check-sat-assuming ( (not temporal_splits_AT4) ))
;; END

(echo |checking property at 4|)
(check-sat)

(pop 1)
(declare-fun flat_data_in_AT4 () (_ BitVec 8))
(declare-fun f.entries_AT5 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT5 () (_ BitVec 4))
(declare-fun start_AT4 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT5 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT5 () (_ BitVec 4))
(declare-fun ff_en.Q_AT5 () (_ BitVec 1))
(declare-fun pop_AT5 () (_ BitVec 1))
(declare-fun push_AT5 () (_ BitVec 1))
(declare-fun rst_AT5 () (_ BitVec 1))
(declare-fun prop_signal_AT5 () (_ BitVec 1))
(declare-fun data_out_vld_AT5 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT5 () (_ BitVec 4))

(assert (= (bvor push_AT5 pop_AT5) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT5) ((_ extract 2 0) f.ff_wrPtr.Q_AT5)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT5) ((_ extract 3 3) f.ff_wrPtr.Q_AT5))))) (bvnot push_AT5)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT5 f.ff_wrPtr.Q_AT5)) (bvnot pop_AT5)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT5) (bvnot #b1)) #b1))
(assert (= prop_signal_AT5 (bvor (bvnot (bvand (bvand ff_en.Q_AT5 (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT5 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5) #b0000)) pop_AT5) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5))) #b0000))))) (bvcomp ff_magic_packet.Q_AT5 (select f.entries_AT5 ((_ extract 2 0) f.ff_rdPtr.Q_AT5))))))
(assert (= data_out_vld_AT5 (bvand (bvand ff_en.Q_AT5 (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT5 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5) #b0000)) pop_AT5) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT5 (bvite (bvcomp rst_AT4 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT4 pop_AT4) rst_AT4) #b1) (bvite (bvcomp push_AT4 #b1) (bvadd f.ff_wrPtr.Q_AT4 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT4) f.ff_wrPtr.Q_AT4))))
(assert (= f.entries_AT5 (store f.entries_AT4 ((_ extract 2 0) f.ff_wrPtr.Q_AT4) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (bvite (bvcomp push_AT4 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT4 (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (bvite (bvcomp push_AT4 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT4 ((_ extract 2 0) f.ff_wrPtr.Q_AT4)) (bvnot (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT4 #b1) #b1 #b0) (bvite (bvcomp push_AT4 #b1) #b1 #b0))))))))))) (select f.entries_AT4 ((_ extract 2 0) f.ff_wrPtr.Q_AT4))))))
(assert (= f.ff_rdPtr.Q_AT5 (bvite (bvcomp rst_AT4 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT4 pop_AT4) rst_AT4) #b1) (bvite (bvcomp pop_AT4 #b1) (bvadd f.ff_rdPtr.Q_AT4 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT4) f.ff_rdPtr.Q_AT4))))
(assert (= ff_magic_packet.Q_AT5 (bvite (bvcomp rst_AT4 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT4 push_AT4) (bvnot ff_en.Q_AT4)) #b1) flat_data_in_AT4 ff_magic_packet.Q_AT4))))
(assert (= mpt.ff_cnt.Q_AT5 (bvite (bvcomp rst_AT4 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT4 pop_AT4) rst_AT4) ff_en.Q_AT4) #b1) (bvite (bvcomp rst_AT4 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4) #b0000)) pop_AT4) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT4 #b1000)) push_AT4) (bvnot ff_en.Q_AT4)) #b1) (bvadd mpt.ff_cnt.Q_AT4 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT4))) mpt.ff_cnt.Q_AT4))))
(assert (= ff_en.Q_AT5 (bvite (bvcomp rst_AT4 #b1) #b0 (bvite (bvcomp ff_en.Q_AT4 #b1) #b1 (bvor ff_en.Q_AT4 (bvand start_AT4 push_AT4))))))
(push 1)

(assert (= prop_signal_AT5 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT5 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT5 Bool)
(assert (= en_AT1_prop_AT5 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT5 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT5))))))

(declare-const en_AT2_prop_AT5 Bool)
(assert (= en_AT2_prop_AT5 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT5 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT5))))))

(declare-const en_AT3_prop_AT5 Bool)
(assert (= en_AT3_prop_AT5 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT5 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT5))))))

(declare-const en_AT4_prop_AT5 Bool)
(assert (= en_AT4_prop_AT5 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT5 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT5))))))

(declare-const en_AT5_prop_AT5 Bool)
(assert (= en_AT5_prop_AT5 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT5 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT5))))))

(declare-const temporal_splits_AT5 Bool)
(assert (= temporal_splits_AT5 (and en_AT1_prop_AT5 en_AT2_prop_AT5 en_AT3_prop_AT5 en_AT4_prop_AT5 en_AT5_prop_AT5)))
(check-sat-assuming ( (not temporal_splits_AT5) ))
;; END

(echo |checking property at 5|)
(check-sat)

(pop 1)
(declare-fun flat_data_in_AT5 () (_ BitVec 8))
(declare-fun f.entries_AT6 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT6 () (_ BitVec 4))
(declare-fun start_AT5 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT6 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT6 () (_ BitVec 4))
(declare-fun ff_en.Q_AT6 () (_ BitVec 1))
(declare-fun pop_AT6 () (_ BitVec 1))
(declare-fun push_AT6 () (_ BitVec 1))
(declare-fun rst_AT6 () (_ BitVec 1))
(declare-fun prop_signal_AT6 () (_ BitVec 1))
(declare-fun data_out_vld_AT6 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT6 () (_ BitVec 4))

(assert (= (bvor push_AT6 pop_AT6) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT6) ((_ extract 2 0) f.ff_wrPtr.Q_AT6)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT6) ((_ extract 3 3) f.ff_wrPtr.Q_AT6))))) (bvnot push_AT6)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT6 f.ff_wrPtr.Q_AT6)) (bvnot pop_AT6)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT6) (bvnot #b1)) #b1))
(assert (= prop_signal_AT6 (bvor (bvnot (bvand (bvand ff_en.Q_AT6 (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT6 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6) #b0000)) pop_AT6) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6))) #b0000))))) (bvcomp ff_magic_packet.Q_AT6 (select f.entries_AT6 ((_ extract 2 0) f.ff_rdPtr.Q_AT6))))))
(assert (= data_out_vld_AT6 (bvand (bvand ff_en.Q_AT6 (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT6 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6) #b0000)) pop_AT6) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT6 (bvite (bvcomp rst_AT5 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT5 pop_AT5) rst_AT5) #b1) (bvite (bvcomp push_AT5 #b1) (bvadd f.ff_wrPtr.Q_AT5 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT5) f.ff_wrPtr.Q_AT5))))
(assert (= f.entries_AT6 (store f.entries_AT5 ((_ extract 2 0) f.ff_wrPtr.Q_AT5) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (bvite (bvcomp push_AT5 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT5 (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (bvite (bvcomp push_AT5 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT5 ((_ extract 2 0) f.ff_wrPtr.Q_AT5)) (bvnot (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT5 #b1) #b1 #b0) (bvite (bvcomp push_AT5 #b1) #b1 #b0))))))))))) (select f.entries_AT5 ((_ extract 2 0) f.ff_wrPtr.Q_AT5))))))
(assert (= f.ff_rdPtr.Q_AT6 (bvite (bvcomp rst_AT5 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT5 pop_AT5) rst_AT5) #b1) (bvite (bvcomp pop_AT5 #b1) (bvadd f.ff_rdPtr.Q_AT5 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT5) f.ff_rdPtr.Q_AT5))))
(assert (= ff_magic_packet.Q_AT6 (bvite (bvcomp rst_AT5 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT5 push_AT5) (bvnot ff_en.Q_AT5)) #b1) flat_data_in_AT5 ff_magic_packet.Q_AT5))))
(assert (= mpt.ff_cnt.Q_AT6 (bvite (bvcomp rst_AT5 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT5 pop_AT5) rst_AT5) ff_en.Q_AT5) #b1) (bvite (bvcomp rst_AT5 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5) #b0000)) pop_AT5) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT5 #b1000)) push_AT5) (bvnot ff_en.Q_AT5)) #b1) (bvadd mpt.ff_cnt.Q_AT5 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT5))) mpt.ff_cnt.Q_AT5))))
(assert (= ff_en.Q_AT6 (bvite (bvcomp rst_AT5 #b1) #b0 (bvite (bvcomp ff_en.Q_AT5 #b1) #b1 (bvor ff_en.Q_AT5 (bvand start_AT5 push_AT5))))))
(push 1)

(assert (= prop_signal_AT6 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT6 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT6 Bool)
(assert (= en_AT1_prop_AT6 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT6 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT6))))))

(declare-const en_AT2_prop_AT6 Bool)
(assert (= en_AT2_prop_AT6 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT6 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT6))))))

(declare-const en_AT3_prop_AT6 Bool)
(assert (= en_AT3_prop_AT6 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT6 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT6))))))

(declare-const en_AT4_prop_AT6 Bool)
(assert (= en_AT4_prop_AT6 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT6 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT6))))))

(declare-const en_AT5_prop_AT6 Bool)
(assert (= en_AT5_prop_AT6 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT6 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT6))))))

(declare-const en_AT6_prop_AT6 Bool)
(assert (= en_AT6_prop_AT6 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT6 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT6))))))

(declare-const temporal_splits_AT6 Bool)
(assert (= temporal_splits_AT6 (and en_AT1_prop_AT6 en_AT2_prop_AT6 en_AT3_prop_AT6 en_AT4_prop_AT6 en_AT5_prop_AT6 en_AT6_prop_AT6)))
(check-sat-assuming ( (not temporal_splits_AT6) ))
;; END

(echo |checking property at 6|)
(check-sat)

(pop 1)
(declare-fun f.entries_AT7 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT7 () (_ BitVec 4))
(declare-fun start_AT6 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT7 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT7 () (_ BitVec 4))
(declare-fun ff_en.Q_AT7 () (_ BitVec 1))
(declare-fun pop_AT7 () (_ BitVec 1))
(declare-fun push_AT7 () (_ BitVec 1))
(declare-fun rst_AT7 () (_ BitVec 1))
(declare-fun prop_signal_AT7 () (_ BitVec 1))
(declare-fun data_out_vld_AT7 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT7 () (_ BitVec 4))
(declare-fun flat_data_in_AT6 () (_ BitVec 8))

(assert (= (bvor push_AT7 pop_AT7) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT7) ((_ extract 2 0) f.ff_wrPtr.Q_AT7)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT7) ((_ extract 3 3) f.ff_wrPtr.Q_AT7))))) (bvnot push_AT7)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT7 f.ff_wrPtr.Q_AT7)) (bvnot pop_AT7)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT7) (bvnot #b1)) #b1))
(assert (= prop_signal_AT7 (bvor (bvnot (bvand (bvand ff_en.Q_AT7 (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT7 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7) #b0000)) pop_AT7) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7))) #b0000))))) (bvcomp ff_magic_packet.Q_AT7 (select f.entries_AT7 ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))
(assert (= data_out_vld_AT7 (bvand (bvand ff_en.Q_AT7 (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT7 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7) #b0000)) pop_AT7) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT7 (bvite (bvcomp rst_AT6 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT6 pop_AT6) rst_AT6) #b1) (bvite (bvcomp push_AT6 #b1) (bvadd f.ff_wrPtr.Q_AT6 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT6) f.ff_wrPtr.Q_AT6))))
(assert (= f.entries_AT7 (store f.entries_AT6 ((_ extract 2 0) f.ff_wrPtr.Q_AT6) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (bvite (bvcomp push_AT6 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT6 (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (bvite (bvcomp push_AT6 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT6 ((_ extract 2 0) f.ff_wrPtr.Q_AT6)) (bvnot (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT6 #b1) #b1 #b0) (bvite (bvcomp push_AT6 #b1) #b1 #b0))))))))))) (select f.entries_AT6 ((_ extract 2 0) f.ff_wrPtr.Q_AT6))))))
(assert (= f.ff_rdPtr.Q_AT7 (bvite (bvcomp rst_AT6 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT6 pop_AT6) rst_AT6) #b1) (bvite (bvcomp pop_AT6 #b1) (bvadd f.ff_rdPtr.Q_AT6 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT6) f.ff_rdPtr.Q_AT6))))
(assert (= ff_magic_packet.Q_AT7 (bvite (bvcomp rst_AT6 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT6 push_AT6) (bvnot ff_en.Q_AT6)) #b1) flat_data_in_AT6 ff_magic_packet.Q_AT6))))
(assert (= mpt.ff_cnt.Q_AT7 (bvite (bvcomp rst_AT6 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT6 pop_AT6) rst_AT6) ff_en.Q_AT6) #b1) (bvite (bvcomp rst_AT6 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6) #b0000)) pop_AT6) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT6 #b1000)) push_AT6) (bvnot ff_en.Q_AT6)) #b1) (bvadd mpt.ff_cnt.Q_AT6 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT6))) mpt.ff_cnt.Q_AT6))))
(assert (= ff_en.Q_AT7 (bvite (bvcomp rst_AT6 #b1) #b0 (bvite (bvcomp ff_en.Q_AT6 #b1) #b1 (bvor ff_en.Q_AT6 (bvand start_AT6 push_AT6))))))
(push 1)

(assert (= prop_signal_AT7 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT7 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT7 Bool)
(assert (= en_AT1_prop_AT7 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT7 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))

(declare-const en_AT2_prop_AT7 Bool)
(assert (= en_AT2_prop_AT7 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT7 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))

(declare-const en_AT3_prop_AT7 Bool)
(assert (= en_AT3_prop_AT7 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT7 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))

(declare-const en_AT4_prop_AT7 Bool)
(assert (= en_AT4_prop_AT7 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT7 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))

(declare-const en_AT5_prop_AT7 Bool)
(assert (= en_AT5_prop_AT7 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT7 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))

(declare-const en_AT6_prop_AT7 Bool)
(assert (= en_AT6_prop_AT7 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT7 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))

(declare-const en_AT7_prop_AT7 Bool)
(assert (= en_AT7_prop_AT7 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT7 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT7))))))

(declare-const temporal_splits_AT7 Bool)
(assert (= temporal_splits_AT7 (and en_AT1_prop_AT7 en_AT2_prop_AT7 en_AT3_prop_AT7 en_AT4_prop_AT7 en_AT5_prop_AT7 en_AT6_prop_AT7 en_AT7_prop_AT7)))
(check-sat-assuming ( (not temporal_splits_AT7) ))
;; END

(echo |checking property at 7|)
(check-sat)

(pop 1)
(declare-fun f.entries_AT8 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT8 () (_ BitVec 4))
(declare-fun start_AT7 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT8 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT8 () (_ BitVec 4))
(declare-fun ff_en.Q_AT8 () (_ BitVec 1))
(declare-fun pop_AT8 () (_ BitVec 1))
(declare-fun push_AT8 () (_ BitVec 1))
(declare-fun rst_AT8 () (_ BitVec 1))
(declare-fun prop_signal_AT8 () (_ BitVec 1))
(declare-fun data_out_vld_AT8 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT8 () (_ BitVec 4))
(declare-fun flat_data_in_AT7 () (_ BitVec 8))

(assert (= (bvor push_AT8 pop_AT8) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT8) ((_ extract 2 0) f.ff_wrPtr.Q_AT8)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT8) ((_ extract 3 3) f.ff_wrPtr.Q_AT8))))) (bvnot push_AT8)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT8 f.ff_wrPtr.Q_AT8)) (bvnot pop_AT8)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT8) (bvnot #b1)) #b1))
(assert (= prop_signal_AT8 (bvor (bvnot (bvand (bvand ff_en.Q_AT8 (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT8 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8) #b0000)) pop_AT8) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8))) #b0000))))) (bvcomp ff_magic_packet.Q_AT8 (select f.entries_AT8 ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))
(assert (= data_out_vld_AT8 (bvand (bvand ff_en.Q_AT8 (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT8 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8) #b0000)) pop_AT8) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT8 (bvite (bvcomp rst_AT7 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT7 pop_AT7) rst_AT7) #b1) (bvite (bvcomp push_AT7 #b1) (bvadd f.ff_wrPtr.Q_AT7 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT7) f.ff_wrPtr.Q_AT7))))
(assert (= f.entries_AT8 (store f.entries_AT7 ((_ extract 2 0) f.ff_wrPtr.Q_AT7) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (bvite (bvcomp push_AT7 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT7 (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (bvite (bvcomp push_AT7 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT7 ((_ extract 2 0) f.ff_wrPtr.Q_AT7)) (bvnot (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT7 #b1) #b1 #b0) (bvite (bvcomp push_AT7 #b1) #b1 #b0))))))))))) (select f.entries_AT7 ((_ extract 2 0) f.ff_wrPtr.Q_AT7))))))
(assert (= f.ff_rdPtr.Q_AT8 (bvite (bvcomp rst_AT7 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT7 pop_AT7) rst_AT7) #b1) (bvite (bvcomp pop_AT7 #b1) (bvadd f.ff_rdPtr.Q_AT7 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT7) f.ff_rdPtr.Q_AT7))))
(assert (= ff_magic_packet.Q_AT8 (bvite (bvcomp rst_AT7 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT7 push_AT7) (bvnot ff_en.Q_AT7)) #b1) flat_data_in_AT7 ff_magic_packet.Q_AT7))))
(assert (= mpt.ff_cnt.Q_AT8 (bvite (bvcomp rst_AT7 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT7 pop_AT7) rst_AT7) ff_en.Q_AT7) #b1) (bvite (bvcomp rst_AT7 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7) #b0000)) pop_AT7) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT7 #b1000)) push_AT7) (bvnot ff_en.Q_AT7)) #b1) (bvadd mpt.ff_cnt.Q_AT7 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT7))) mpt.ff_cnt.Q_AT7))))
(assert (= ff_en.Q_AT8 (bvite (bvcomp rst_AT7 #b1) #b0 (bvite (bvcomp ff_en.Q_AT7 #b1) #b1 (bvor ff_en.Q_AT7 (bvand start_AT7 push_AT7))))))
(push 1)

(assert (= prop_signal_AT8 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT8 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT8 Bool)
(assert (= en_AT1_prop_AT8 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const en_AT2_prop_AT8 Bool)
(assert (= en_AT2_prop_AT8 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const en_AT3_prop_AT8 Bool)
(assert (= en_AT3_prop_AT8 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const en_AT4_prop_AT8 Bool)
(assert (= en_AT4_prop_AT8 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const en_AT5_prop_AT8 Bool)
(assert (= en_AT5_prop_AT8 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const en_AT6_prop_AT8 Bool)
(assert (= en_AT6_prop_AT8 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const en_AT7_prop_AT8 Bool)
(assert (= en_AT7_prop_AT8 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const en_AT8_prop_AT8 Bool)
(assert (= en_AT8_prop_AT8 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT8 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT8))))))

(declare-const temporal_splits_AT8 Bool)
(assert (= temporal_splits_AT8 (and en_AT1_prop_AT8 en_AT2_prop_AT8 en_AT3_prop_AT8 en_AT4_prop_AT8 en_AT5_prop_AT8 en_AT6_prop_AT8 en_AT7_prop_AT8 en_AT8_prop_AT8)))
(check-sat-assuming ( (not temporal_splits_AT8) ))
;; END

(echo |checking property at 8|)
(check-sat)

(pop 1)
(declare-fun f.entries_AT9 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT9 () (_ BitVec 4))
(declare-fun start_AT8 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT9 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT9 () (_ BitVec 4))
(declare-fun ff_en.Q_AT9 () (_ BitVec 1))
(declare-fun pop_AT9 () (_ BitVec 1))
(declare-fun push_AT9 () (_ BitVec 1))
(declare-fun rst_AT9 () (_ BitVec 1))
(declare-fun prop_signal_AT9 () (_ BitVec 1))
(declare-fun data_out_vld_AT9 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT9 () (_ BitVec 4))
(declare-fun flat_data_in_AT8 () (_ BitVec 8))

(assert (= (bvor push_AT9 pop_AT9) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT9) ((_ extract 2 0) f.ff_wrPtr.Q_AT9)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT9) ((_ extract 3 3) f.ff_wrPtr.Q_AT9))))) (bvnot push_AT9)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT9 f.ff_wrPtr.Q_AT9)) (bvnot pop_AT9)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT9) (bvnot #b1)) #b1))
(assert (= prop_signal_AT9 (bvor (bvnot (bvand (bvand ff_en.Q_AT9 (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT9 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9) #b0000)) pop_AT9) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9))) #b0000))))) (bvcomp ff_magic_packet.Q_AT9 (select f.entries_AT9 ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))
(assert (= data_out_vld_AT9 (bvand (bvand ff_en.Q_AT9 (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT9 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9) #b0000)) pop_AT9) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT9 (bvite (bvcomp rst_AT8 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT8 pop_AT8) rst_AT8) #b1) (bvite (bvcomp push_AT8 #b1) (bvadd f.ff_wrPtr.Q_AT8 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT8) f.ff_wrPtr.Q_AT8))))
(assert (= f.entries_AT9 (store f.entries_AT8 ((_ extract 2 0) f.ff_wrPtr.Q_AT8) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (bvite (bvcomp push_AT8 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT8 (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (bvite (bvcomp push_AT8 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT8 ((_ extract 2 0) f.ff_wrPtr.Q_AT8)) (bvnot (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT8 #b1) #b1 #b0) (bvite (bvcomp push_AT8 #b1) #b1 #b0))))))))))) (select f.entries_AT8 ((_ extract 2 0) f.ff_wrPtr.Q_AT8))))))
(assert (= f.ff_rdPtr.Q_AT9 (bvite (bvcomp rst_AT8 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT8 pop_AT8) rst_AT8) #b1) (bvite (bvcomp pop_AT8 #b1) (bvadd f.ff_rdPtr.Q_AT8 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT8) f.ff_rdPtr.Q_AT8))))
(assert (= ff_magic_packet.Q_AT9 (bvite (bvcomp rst_AT8 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT8 push_AT8) (bvnot ff_en.Q_AT8)) #b1) flat_data_in_AT8 ff_magic_packet.Q_AT8))))
(assert (= mpt.ff_cnt.Q_AT9 (bvite (bvcomp rst_AT8 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT8 pop_AT8) rst_AT8) ff_en.Q_AT8) #b1) (bvite (bvcomp rst_AT8 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8) #b0000)) pop_AT8) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT8 #b1000)) push_AT8) (bvnot ff_en.Q_AT8)) #b1) (bvadd mpt.ff_cnt.Q_AT8 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT8))) mpt.ff_cnt.Q_AT8))))
(assert (= ff_en.Q_AT9 (bvite (bvcomp rst_AT8 #b1) #b0 (bvite (bvcomp ff_en.Q_AT8 #b1) #b1 (bvor ff_en.Q_AT8 (bvand start_AT8 push_AT8))))))
(push 1)

(assert (= prop_signal_AT9 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT9 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT9 Bool)
(assert (= en_AT1_prop_AT9 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT2_prop_AT9 Bool)
(assert (= en_AT2_prop_AT9 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT3_prop_AT9 Bool)
(assert (= en_AT3_prop_AT9 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT4_prop_AT9 Bool)
(assert (= en_AT4_prop_AT9 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT5_prop_AT9 Bool)
(assert (= en_AT5_prop_AT9 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT6_prop_AT9 Bool)
(assert (= en_AT6_prop_AT9 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT7_prop_AT9 Bool)
(assert (= en_AT7_prop_AT9 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT8_prop_AT9 Bool)
(assert (= en_AT8_prop_AT9 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const en_AT9_prop_AT9 Bool)
(assert (= en_AT9_prop_AT9 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT9 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT9))))))

(declare-const temporal_splits_AT9 Bool)
(assert (= temporal_splits_AT9 (and en_AT1_prop_AT9 en_AT2_prop_AT9 en_AT3_prop_AT9 en_AT4_prop_AT9 en_AT5_prop_AT9 en_AT6_prop_AT9 en_AT7_prop_AT9 en_AT8_prop_AT9 en_AT9_prop_AT9)))
(check-sat-assuming ( (not temporal_splits_AT9) ))
;; END

(echo |checking property at 9|)
(check-sat)

(pop 1)
(declare-fun f.ff_rdPtr.Q_AT10 () (_ BitVec 4))
(declare-fun start_AT9 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT10 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT10 () (_ BitVec 4))
(declare-fun ff_en.Q_AT10 () (_ BitVec 1))
(declare-fun pop_AT10 () (_ BitVec 1))
(declare-fun push_AT10 () (_ BitVec 1))
(declare-fun rst_AT10 () (_ BitVec 1))
(declare-fun prop_signal_AT10 () (_ BitVec 1))
(declare-fun data_out_vld_AT10 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT10 () (_ BitVec 4))
(declare-fun flat_data_in_AT9 () (_ BitVec 8))
(declare-fun f.entries_AT10 () (Array (_ BitVec 3) (_ BitVec 8)))

(assert (= (bvor push_AT10 pop_AT10) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT10) ((_ extract 2 0) f.ff_wrPtr.Q_AT10)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT10) ((_ extract 3 3) f.ff_wrPtr.Q_AT10))))) (bvnot push_AT10)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT10 f.ff_wrPtr.Q_AT10)) (bvnot pop_AT10)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT10) (bvnot #b1)) #b1))
(assert (= prop_signal_AT10 (bvor (bvnot (bvand (bvand ff_en.Q_AT10 (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT10 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10) #b0000)) pop_AT10) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10))) #b0000))))) (bvcomp ff_magic_packet.Q_AT10 (select f.entries_AT10 ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))
(assert (= data_out_vld_AT10 (bvand (bvand ff_en.Q_AT10 (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT10 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10) #b0000)) pop_AT10) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT10 (bvite (bvcomp rst_AT9 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT9 pop_AT9) rst_AT9) #b1) (bvite (bvcomp push_AT9 #b1) (bvadd f.ff_wrPtr.Q_AT9 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT9) f.ff_wrPtr.Q_AT9))))
(assert (= f.entries_AT10 (store f.entries_AT9 ((_ extract 2 0) f.ff_wrPtr.Q_AT9) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (bvite (bvcomp push_AT9 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT9 (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (bvite (bvcomp push_AT9 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT9 ((_ extract 2 0) f.ff_wrPtr.Q_AT9)) (bvnot (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT9 #b1) #b1 #b0) (bvite (bvcomp push_AT9 #b1) #b1 #b0))))))))))) (select f.entries_AT9 ((_ extract 2 0) f.ff_wrPtr.Q_AT9))))))
(assert (= f.ff_rdPtr.Q_AT10 (bvite (bvcomp rst_AT9 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT9 pop_AT9) rst_AT9) #b1) (bvite (bvcomp pop_AT9 #b1) (bvadd f.ff_rdPtr.Q_AT9 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT9) f.ff_rdPtr.Q_AT9))))
(assert (= ff_magic_packet.Q_AT10 (bvite (bvcomp rst_AT9 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT9 push_AT9) (bvnot ff_en.Q_AT9)) #b1) flat_data_in_AT9 ff_magic_packet.Q_AT9))))
(assert (= mpt.ff_cnt.Q_AT10 (bvite (bvcomp rst_AT9 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT9 pop_AT9) rst_AT9) ff_en.Q_AT9) #b1) (bvite (bvcomp rst_AT9 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9) #b0000)) pop_AT9) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT9 #b1000)) push_AT9) (bvnot ff_en.Q_AT9)) #b1) (bvadd mpt.ff_cnt.Q_AT9 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT9))) mpt.ff_cnt.Q_AT9))))
(assert (= ff_en.Q_AT10 (bvite (bvcomp rst_AT9 #b1) #b0 (bvite (bvcomp ff_en.Q_AT9 #b1) #b1 (bvor ff_en.Q_AT9 (bvand start_AT9 push_AT9))))))
(push 1)

(assert (= prop_signal_AT10 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT10 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT10 Bool)
(assert (= en_AT1_prop_AT10 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT2_prop_AT10 Bool)
(assert (= en_AT2_prop_AT10 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT3_prop_AT10 Bool)
(assert (= en_AT3_prop_AT10 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT4_prop_AT10 Bool)
(assert (= en_AT4_prop_AT10 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT5_prop_AT10 Bool)
(assert (= en_AT5_prop_AT10 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT6_prop_AT10 Bool)
(assert (= en_AT6_prop_AT10 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT7_prop_AT10 Bool)
(assert (= en_AT7_prop_AT10 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT8_prop_AT10 Bool)
(assert (= en_AT8_prop_AT10 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT9_prop_AT10 Bool)
(assert (= en_AT9_prop_AT10 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const en_AT10_prop_AT10 Bool)
(assert (= en_AT10_prop_AT10 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT10 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT10))))))

(declare-const temporal_splits_AT10 Bool)
(assert (= temporal_splits_AT10 (and en_AT1_prop_AT10 en_AT2_prop_AT10 en_AT3_prop_AT10 en_AT4_prop_AT10 en_AT5_prop_AT10 en_AT6_prop_AT10 en_AT7_prop_AT10 en_AT8_prop_AT10 en_AT9_prop_AT10 en_AT10_prop_AT10)))
(check-sat-assuming ( (not temporal_splits_AT10) ))
;; END

(echo |checking property at 10|)
(check-sat)

(pop 1)
(declare-fun f.ff_rdPtr.Q_AT11 () (_ BitVec 4))
(declare-fun start_AT10 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT11 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT11 () (_ BitVec 4))
(declare-fun ff_en.Q_AT11 () (_ BitVec 1))
(declare-fun pop_AT11 () (_ BitVec 1))
(declare-fun push_AT11 () (_ BitVec 1))
(declare-fun rst_AT11 () (_ BitVec 1))
(declare-fun prop_signal_AT11 () (_ BitVec 1))
(declare-fun data_out_vld_AT11 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT11 () (_ BitVec 4))
(declare-fun flat_data_in_AT10 () (_ BitVec 8))
(declare-fun f.entries_AT11 () (Array (_ BitVec 3) (_ BitVec 8)))

(assert (= (bvor push_AT11 pop_AT11) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT11) ((_ extract 2 0) f.ff_wrPtr.Q_AT11)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT11) ((_ extract 3 3) f.ff_wrPtr.Q_AT11))))) (bvnot push_AT11)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT11 f.ff_wrPtr.Q_AT11)) (bvnot pop_AT11)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT11) (bvnot #b1)) #b1))
(assert (= prop_signal_AT11 (bvor (bvnot (bvand (bvand ff_en.Q_AT11 (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT11 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11) #b0000)) pop_AT11) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11))) #b0000))))) (bvcomp ff_magic_packet.Q_AT11 (select f.entries_AT11 ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))
(assert (= data_out_vld_AT11 (bvand (bvand ff_en.Q_AT11 (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT11 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11) #b0000)) pop_AT11) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT11 (bvite (bvcomp rst_AT10 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT10 pop_AT10) rst_AT10) #b1) (bvite (bvcomp push_AT10 #b1) (bvadd f.ff_wrPtr.Q_AT10 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT10) f.ff_wrPtr.Q_AT10))))
(assert (= f.entries_AT11 (store f.entries_AT10 ((_ extract 2 0) f.ff_wrPtr.Q_AT10) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (bvite (bvcomp push_AT10 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT10 (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (bvite (bvcomp push_AT10 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT10 ((_ extract 2 0) f.ff_wrPtr.Q_AT10)) (bvnot (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT10 #b1) #b1 #b0) (bvite (bvcomp push_AT10 #b1) #b1 #b0))))))))))) (select f.entries_AT10 ((_ extract 2 0) f.ff_wrPtr.Q_AT10))))))
(assert (= f.ff_rdPtr.Q_AT11 (bvite (bvcomp rst_AT10 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT10 pop_AT10) rst_AT10) #b1) (bvite (bvcomp pop_AT10 #b1) (bvadd f.ff_rdPtr.Q_AT10 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT10) f.ff_rdPtr.Q_AT10))))
(assert (= ff_magic_packet.Q_AT11 (bvite (bvcomp rst_AT10 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT10 push_AT10) (bvnot ff_en.Q_AT10)) #b1) flat_data_in_AT10 ff_magic_packet.Q_AT10))))
(assert (= mpt.ff_cnt.Q_AT11 (bvite (bvcomp rst_AT10 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT10 pop_AT10) rst_AT10) ff_en.Q_AT10) #b1) (bvite (bvcomp rst_AT10 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10) #b0000)) pop_AT10) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT10 #b1000)) push_AT10) (bvnot ff_en.Q_AT10)) #b1) (bvadd mpt.ff_cnt.Q_AT10 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT10))) mpt.ff_cnt.Q_AT10))))
(assert (= ff_en.Q_AT11 (bvite (bvcomp rst_AT10 #b1) #b0 (bvite (bvcomp ff_en.Q_AT10 #b1) #b1 (bvor ff_en.Q_AT10 (bvand start_AT10 push_AT10))))))
(push 1)

(assert (= prop_signal_AT11 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT11 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT11 Bool)
(assert (= en_AT1_prop_AT11 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT2_prop_AT11 Bool)
(assert (= en_AT2_prop_AT11 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT3_prop_AT11 Bool)
(assert (= en_AT3_prop_AT11 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT4_prop_AT11 Bool)
(assert (= en_AT4_prop_AT11 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT5_prop_AT11 Bool)
(assert (= en_AT5_prop_AT11 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT6_prop_AT11 Bool)
(assert (= en_AT6_prop_AT11 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT7_prop_AT11 Bool)
(assert (= en_AT7_prop_AT11 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT8_prop_AT11 Bool)
(assert (= en_AT8_prop_AT11 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT9_prop_AT11 Bool)
(assert (= en_AT9_prop_AT11 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT10_prop_AT11 Bool)
(assert (= en_AT10_prop_AT11 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const en_AT11_prop_AT11 Bool)
(assert (= en_AT11_prop_AT11 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT11 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT11))))))

(declare-const temporal_splits_AT11 Bool)
(assert (= temporal_splits_AT11 (and en_AT1_prop_AT11 en_AT2_prop_AT11 en_AT3_prop_AT11 en_AT4_prop_AT11 en_AT5_prop_AT11 en_AT6_prop_AT11 en_AT7_prop_AT11 en_AT8_prop_AT11 en_AT9_prop_AT11 en_AT10_prop_AT11 en_AT11_prop_AT11)))
(check-sat-assuming ( (not temporal_splits_AT11) ))
;; END

(echo |checking property at 11|)
(check-sat)

(pop 1)
(declare-fun start_AT11 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT12 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT12 () (_ BitVec 4))
(declare-fun ff_en.Q_AT12 () (_ BitVec 1))
(declare-fun pop_AT12 () (_ BitVec 1))
(declare-fun push_AT12 () (_ BitVec 1))
(declare-fun rst_AT12 () (_ BitVec 1))
(declare-fun prop_signal_AT12 () (_ BitVec 1))
(declare-fun data_out_vld_AT12 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT12 () (_ BitVec 4))
(declare-fun flat_data_in_AT11 () (_ BitVec 8))
(declare-fun f.entries_AT12 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT12 () (_ BitVec 4))

(assert (= (bvor push_AT12 pop_AT12) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT12) ((_ extract 2 0) f.ff_wrPtr.Q_AT12)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT12) ((_ extract 3 3) f.ff_wrPtr.Q_AT12))))) (bvnot push_AT12)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT12 f.ff_wrPtr.Q_AT12)) (bvnot pop_AT12)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT12) (bvnot #b1)) #b1))
(assert (= prop_signal_AT12 (bvor (bvnot (bvand (bvand ff_en.Q_AT12 (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT12 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12) #b0000)) pop_AT12) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12))) #b0000))))) (bvcomp ff_magic_packet.Q_AT12 (select f.entries_AT12 ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))
(assert (= data_out_vld_AT12 (bvand (bvand ff_en.Q_AT12 (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT12 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12) #b0000)) pop_AT12) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT12 (bvite (bvcomp rst_AT11 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT11 pop_AT11) rst_AT11) #b1) (bvite (bvcomp push_AT11 #b1) (bvadd f.ff_wrPtr.Q_AT11 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT11) f.ff_wrPtr.Q_AT11))))
(assert (= f.entries_AT12 (store f.entries_AT11 ((_ extract 2 0) f.ff_wrPtr.Q_AT11) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (bvite (bvcomp push_AT11 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT11 (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (bvite (bvcomp push_AT11 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT11 ((_ extract 2 0) f.ff_wrPtr.Q_AT11)) (bvnot (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT11 #b1) #b1 #b0) (bvite (bvcomp push_AT11 #b1) #b1 #b0))))))))))) (select f.entries_AT11 ((_ extract 2 0) f.ff_wrPtr.Q_AT11))))))
(assert (= f.ff_rdPtr.Q_AT12 (bvite (bvcomp rst_AT11 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT11 pop_AT11) rst_AT11) #b1) (bvite (bvcomp pop_AT11 #b1) (bvadd f.ff_rdPtr.Q_AT11 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT11) f.ff_rdPtr.Q_AT11))))
(assert (= ff_magic_packet.Q_AT12 (bvite (bvcomp rst_AT11 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT11 push_AT11) (bvnot ff_en.Q_AT11)) #b1) flat_data_in_AT11 ff_magic_packet.Q_AT11))))
(assert (= mpt.ff_cnt.Q_AT12 (bvite (bvcomp rst_AT11 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT11 pop_AT11) rst_AT11) ff_en.Q_AT11) #b1) (bvite (bvcomp rst_AT11 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11) #b0000)) pop_AT11) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT11 #b1000)) push_AT11) (bvnot ff_en.Q_AT11)) #b1) (bvadd mpt.ff_cnt.Q_AT11 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT11))) mpt.ff_cnt.Q_AT11))))
(assert (= ff_en.Q_AT12 (bvite (bvcomp rst_AT11 #b1) #b0 (bvite (bvcomp ff_en.Q_AT11 #b1) #b1 (bvor ff_en.Q_AT11 (bvand start_AT11 push_AT11))))))
(push 1)

(assert (= prop_signal_AT12 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT12 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT12 Bool)
(assert (= en_AT1_prop_AT12 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT2_prop_AT12 Bool)
(assert (= en_AT2_prop_AT12 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT3_prop_AT12 Bool)
(assert (= en_AT3_prop_AT12 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT4_prop_AT12 Bool)
(assert (= en_AT4_prop_AT12 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT5_prop_AT12 Bool)
(assert (= en_AT5_prop_AT12 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT6_prop_AT12 Bool)
(assert (= en_AT6_prop_AT12 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT7_prop_AT12 Bool)
(assert (= en_AT7_prop_AT12 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT8_prop_AT12 Bool)
(assert (= en_AT8_prop_AT12 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT9_prop_AT12 Bool)
(assert (= en_AT9_prop_AT12 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT10_prop_AT12 Bool)
(assert (= en_AT10_prop_AT12 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT11_prop_AT12 Bool)
(assert (= en_AT11_prop_AT12 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const en_AT12_prop_AT12 Bool)
(assert (= en_AT12_prop_AT12 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT12 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT12))))))

(declare-const temporal_splits_AT12 Bool)
(assert (= temporal_splits_AT12 (and en_AT1_prop_AT12 en_AT2_prop_AT12 en_AT3_prop_AT12 en_AT4_prop_AT12 en_AT5_prop_AT12 en_AT6_prop_AT12 en_AT7_prop_AT12 en_AT8_prop_AT12 en_AT9_prop_AT12 en_AT10_prop_AT12 en_AT11_prop_AT12 en_AT12_prop_AT12)))
(check-sat-assuming ( (not temporal_splits_AT12) ))
;; END

(echo |checking property at 12|)
(check-sat)

(pop 1)
(declare-fun ff_magic_packet.Q_AT13 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT13 () (_ BitVec 4))
(declare-fun ff_en.Q_AT13 () (_ BitVec 1))
(declare-fun pop_AT13 () (_ BitVec 1))
(declare-fun push_AT13 () (_ BitVec 1))
(declare-fun rst_AT13 () (_ BitVec 1))
(declare-fun prop_signal_AT13 () (_ BitVec 1))
(declare-fun data_out_vld_AT13 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT13 () (_ BitVec 4))
(declare-fun flat_data_in_AT12 () (_ BitVec 8))
(declare-fun f.entries_AT13 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT13 () (_ BitVec 4))
(declare-fun start_AT12 () (_ BitVec 1))

(assert (= (bvor push_AT13 pop_AT13) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT13) ((_ extract 2 0) f.ff_wrPtr.Q_AT13)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT13) ((_ extract 3 3) f.ff_wrPtr.Q_AT13))))) (bvnot push_AT13)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT13 f.ff_wrPtr.Q_AT13)) (bvnot pop_AT13)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT13) (bvnot #b1)) #b1))
(assert (= prop_signal_AT13 (bvor (bvnot (bvand (bvand ff_en.Q_AT13 (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT13 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13) #b0000)) pop_AT13) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13))) #b0000))))) (bvcomp ff_magic_packet.Q_AT13 (select f.entries_AT13 ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))
(assert (= data_out_vld_AT13 (bvand (bvand ff_en.Q_AT13 (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT13 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13) #b0000)) pop_AT13) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT13 (bvite (bvcomp rst_AT12 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT12 pop_AT12) rst_AT12) #b1) (bvite (bvcomp push_AT12 #b1) (bvadd f.ff_wrPtr.Q_AT12 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT12) f.ff_wrPtr.Q_AT12))))
(assert (= f.entries_AT13 (store f.entries_AT12 ((_ extract 2 0) f.ff_wrPtr.Q_AT12) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (bvite (bvcomp push_AT12 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT12 (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (bvite (bvcomp push_AT12 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT12 ((_ extract 2 0) f.ff_wrPtr.Q_AT12)) (bvnot (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT12 #b1) #b1 #b0) (bvite (bvcomp push_AT12 #b1) #b1 #b0))))))))))) (select f.entries_AT12 ((_ extract 2 0) f.ff_wrPtr.Q_AT12))))))
(assert (= f.ff_rdPtr.Q_AT13 (bvite (bvcomp rst_AT12 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT12 pop_AT12) rst_AT12) #b1) (bvite (bvcomp pop_AT12 #b1) (bvadd f.ff_rdPtr.Q_AT12 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT12) f.ff_rdPtr.Q_AT12))))
(assert (= ff_magic_packet.Q_AT13 (bvite (bvcomp rst_AT12 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT12 push_AT12) (bvnot ff_en.Q_AT12)) #b1) flat_data_in_AT12 ff_magic_packet.Q_AT12))))
(assert (= mpt.ff_cnt.Q_AT13 (bvite (bvcomp rst_AT12 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT12 pop_AT12) rst_AT12) ff_en.Q_AT12) #b1) (bvite (bvcomp rst_AT12 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12) #b0000)) pop_AT12) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT12 #b1000)) push_AT12) (bvnot ff_en.Q_AT12)) #b1) (bvadd mpt.ff_cnt.Q_AT12 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT12))) mpt.ff_cnt.Q_AT12))))
(assert (= ff_en.Q_AT13 (bvite (bvcomp rst_AT12 #b1) #b0 (bvite (bvcomp ff_en.Q_AT12 #b1) #b1 (bvor ff_en.Q_AT12 (bvand start_AT12 push_AT12))))))
(push 1)

(assert (= prop_signal_AT13 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT13 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT13 Bool)
(assert (= en_AT1_prop_AT13 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT2_prop_AT13 Bool)
(assert (= en_AT2_prop_AT13 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT3_prop_AT13 Bool)
(assert (= en_AT3_prop_AT13 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT4_prop_AT13 Bool)
(assert (= en_AT4_prop_AT13 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT5_prop_AT13 Bool)
(assert (= en_AT5_prop_AT13 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT6_prop_AT13 Bool)
(assert (= en_AT6_prop_AT13 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT7_prop_AT13 Bool)
(assert (= en_AT7_prop_AT13 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT8_prop_AT13 Bool)
(assert (= en_AT8_prop_AT13 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT9_prop_AT13 Bool)
(assert (= en_AT9_prop_AT13 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT10_prop_AT13 Bool)
(assert (= en_AT10_prop_AT13 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT11_prop_AT13 Bool)
(assert (= en_AT11_prop_AT13 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT12_prop_AT13 Bool)
(assert (= en_AT12_prop_AT13 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const en_AT13_prop_AT13 Bool)
(assert (= en_AT13_prop_AT13 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT13 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT13))))))

(declare-const temporal_splits_AT13 Bool)
(assert (= temporal_splits_AT13 (and en_AT1_prop_AT13 en_AT2_prop_AT13 en_AT3_prop_AT13 en_AT4_prop_AT13 en_AT5_prop_AT13 en_AT6_prop_AT13 en_AT7_prop_AT13 en_AT8_prop_AT13 en_AT9_prop_AT13 en_AT10_prop_AT13 en_AT11_prop_AT13 en_AT12_prop_AT13 en_AT13_prop_AT13)))
(check-sat-assuming ( (not temporal_splits_AT13) ))
;; END

(echo |checking property at 13|)
(check-sat)

(pop 1)
(declare-fun ff_magic_packet.Q_AT14 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT14 () (_ BitVec 4))
(declare-fun ff_en.Q_AT14 () (_ BitVec 1))
(declare-fun pop_AT14 () (_ BitVec 1))
(declare-fun push_AT14 () (_ BitVec 1))
(declare-fun rst_AT14 () (_ BitVec 1))
(declare-fun prop_signal_AT14 () (_ BitVec 1))
(declare-fun data_out_vld_AT14 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT14 () (_ BitVec 4))
(declare-fun flat_data_in_AT13 () (_ BitVec 8))
(declare-fun f.entries_AT14 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT14 () (_ BitVec 4))
(declare-fun start_AT13 () (_ BitVec 1))

(assert (= (bvor push_AT14 pop_AT14) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT14) ((_ extract 2 0) f.ff_wrPtr.Q_AT14)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT14) ((_ extract 3 3) f.ff_wrPtr.Q_AT14))))) (bvnot push_AT14)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT14 f.ff_wrPtr.Q_AT14)) (bvnot pop_AT14)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT14) (bvnot #b1)) #b1))
(assert (= prop_signal_AT14 (bvor (bvnot (bvand (bvand ff_en.Q_AT14 (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT14 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14) #b0000)) pop_AT14) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14))) #b0000))))) (bvcomp ff_magic_packet.Q_AT14 (select f.entries_AT14 ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))
(assert (= data_out_vld_AT14 (bvand (bvand ff_en.Q_AT14 (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT14 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14) #b0000)) pop_AT14) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT14 (bvite (bvcomp rst_AT13 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT13 pop_AT13) rst_AT13) #b1) (bvite (bvcomp push_AT13 #b1) (bvadd f.ff_wrPtr.Q_AT13 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT13) f.ff_wrPtr.Q_AT13))))
(assert (= f.entries_AT14 (store f.entries_AT13 ((_ extract 2 0) f.ff_wrPtr.Q_AT13) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (bvite (bvcomp push_AT13 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT13 (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (bvite (bvcomp push_AT13 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT13 ((_ extract 2 0) f.ff_wrPtr.Q_AT13)) (bvnot (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT13 #b1) #b1 #b0) (bvite (bvcomp push_AT13 #b1) #b1 #b0))))))))))) (select f.entries_AT13 ((_ extract 2 0) f.ff_wrPtr.Q_AT13))))))
(assert (= f.ff_rdPtr.Q_AT14 (bvite (bvcomp rst_AT13 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT13 pop_AT13) rst_AT13) #b1) (bvite (bvcomp pop_AT13 #b1) (bvadd f.ff_rdPtr.Q_AT13 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT13) f.ff_rdPtr.Q_AT13))))
(assert (= ff_magic_packet.Q_AT14 (bvite (bvcomp rst_AT13 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT13 push_AT13) (bvnot ff_en.Q_AT13)) #b1) flat_data_in_AT13 ff_magic_packet.Q_AT13))))
(assert (= mpt.ff_cnt.Q_AT14 (bvite (bvcomp rst_AT13 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT13 pop_AT13) rst_AT13) ff_en.Q_AT13) #b1) (bvite (bvcomp rst_AT13 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13) #b0000)) pop_AT13) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT13 #b1000)) push_AT13) (bvnot ff_en.Q_AT13)) #b1) (bvadd mpt.ff_cnt.Q_AT13 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT13))) mpt.ff_cnt.Q_AT13))))
(assert (= ff_en.Q_AT14 (bvite (bvcomp rst_AT13 #b1) #b0 (bvite (bvcomp ff_en.Q_AT13 #b1) #b1 (bvor ff_en.Q_AT13 (bvand start_AT13 push_AT13))))))
(push 1)

(assert (= prop_signal_AT14 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT14 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT14 Bool)
(assert (= en_AT1_prop_AT14 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT2_prop_AT14 Bool)
(assert (= en_AT2_prop_AT14 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT3_prop_AT14 Bool)
(assert (= en_AT3_prop_AT14 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT4_prop_AT14 Bool)
(assert (= en_AT4_prop_AT14 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT5_prop_AT14 Bool)
(assert (= en_AT5_prop_AT14 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT6_prop_AT14 Bool)
(assert (= en_AT6_prop_AT14 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT7_prop_AT14 Bool)
(assert (= en_AT7_prop_AT14 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT8_prop_AT14 Bool)
(assert (= en_AT8_prop_AT14 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT9_prop_AT14 Bool)
(assert (= en_AT9_prop_AT14 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT10_prop_AT14 Bool)
(assert (= en_AT10_prop_AT14 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT11_prop_AT14 Bool)
(assert (= en_AT11_prop_AT14 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT12_prop_AT14 Bool)
(assert (= en_AT12_prop_AT14 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT13_prop_AT14 Bool)
(assert (= en_AT13_prop_AT14 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const en_AT14_prop_AT14 Bool)
(assert (= en_AT14_prop_AT14 (=> (and (= ff_en.Q_AT13 #b0) (= ff_en.Q_AT14 #b1)) (or (= data_out_vld_AT14 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT13) ((_ extract 2 0) f.ff_rdPtr.Q_AT14))))))

(declare-const temporal_splits_AT14 Bool)
(assert (= temporal_splits_AT14 (and en_AT1_prop_AT14 en_AT2_prop_AT14 en_AT3_prop_AT14 en_AT4_prop_AT14 en_AT5_prop_AT14 en_AT6_prop_AT14 en_AT7_prop_AT14 en_AT8_prop_AT14 en_AT9_prop_AT14 en_AT10_prop_AT14 en_AT11_prop_AT14 en_AT12_prop_AT14 en_AT13_prop_AT14 en_AT14_prop_AT14)))
(check-sat-assuming ( (not temporal_splits_AT14) ))
;; END

(echo |checking property at 14|)
(check-sat)

(pop 1)
(declare-fun mpt.ff_cnt.Q_AT15 () (_ BitVec 4))
(declare-fun ff_en.Q_AT15 () (_ BitVec 1))
(declare-fun pop_AT15 () (_ BitVec 1))
(declare-fun push_AT15 () (_ BitVec 1))
(declare-fun rst_AT15 () (_ BitVec 1))
(declare-fun prop_signal_AT15 () (_ BitVec 1))
(declare-fun data_out_vld_AT15 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT15 () (_ BitVec 4))
(declare-fun flat_data_in_AT14 () (_ BitVec 8))
(declare-fun f.entries_AT15 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT15 () (_ BitVec 4))
(declare-fun start_AT14 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT15 () (_ BitVec 8))

(assert (= (bvor push_AT15 pop_AT15) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT15) ((_ extract 2 0) f.ff_wrPtr.Q_AT15)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT15) ((_ extract 3 3) f.ff_wrPtr.Q_AT15))))) (bvnot push_AT15)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT15 f.ff_wrPtr.Q_AT15)) (bvnot pop_AT15)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT15) (bvnot #b1)) #b1))
(assert (= prop_signal_AT15 (bvor (bvnot (bvand (bvand ff_en.Q_AT15 (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT15 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15) #b0000)) pop_AT15) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15))) #b0000))))) (bvcomp ff_magic_packet.Q_AT15 (select f.entries_AT15 ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))
(assert (= data_out_vld_AT15 (bvand (bvand ff_en.Q_AT15 (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT15 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15) #b0000)) pop_AT15) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT15 (bvite (bvcomp rst_AT14 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT14 pop_AT14) rst_AT14) #b1) (bvite (bvcomp push_AT14 #b1) (bvadd f.ff_wrPtr.Q_AT14 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT14) f.ff_wrPtr.Q_AT14))))
(assert (= f.entries_AT15 (store f.entries_AT14 ((_ extract 2 0) f.ff_wrPtr.Q_AT14) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (bvite (bvcomp push_AT14 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT14 (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (bvite (bvcomp push_AT14 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT14 ((_ extract 2 0) f.ff_wrPtr.Q_AT14)) (bvnot (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT14 #b1) #b1 #b0) (bvite (bvcomp push_AT14 #b1) #b1 #b0))))))))))) (select f.entries_AT14 ((_ extract 2 0) f.ff_wrPtr.Q_AT14))))))
(assert (= f.ff_rdPtr.Q_AT15 (bvite (bvcomp rst_AT14 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT14 pop_AT14) rst_AT14) #b1) (bvite (bvcomp pop_AT14 #b1) (bvadd f.ff_rdPtr.Q_AT14 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT14) f.ff_rdPtr.Q_AT14))))
(assert (= ff_magic_packet.Q_AT15 (bvite (bvcomp rst_AT14 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT14 push_AT14) (bvnot ff_en.Q_AT14)) #b1) flat_data_in_AT14 ff_magic_packet.Q_AT14))))
(assert (= mpt.ff_cnt.Q_AT15 (bvite (bvcomp rst_AT14 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT14 pop_AT14) rst_AT14) ff_en.Q_AT14) #b1) (bvite (bvcomp rst_AT14 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14) #b0000)) pop_AT14) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT14 #b1000)) push_AT14) (bvnot ff_en.Q_AT14)) #b1) (bvadd mpt.ff_cnt.Q_AT14 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT14))) mpt.ff_cnt.Q_AT14))))
(assert (= ff_en.Q_AT15 (bvite (bvcomp rst_AT14 #b1) #b0 (bvite (bvcomp ff_en.Q_AT14 #b1) #b1 (bvor ff_en.Q_AT14 (bvand start_AT14 push_AT14))))))
(push 1)

(assert (= prop_signal_AT15 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT15 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT15 Bool)
(assert (= en_AT1_prop_AT15 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT2_prop_AT15 Bool)
(assert (= en_AT2_prop_AT15 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT3_prop_AT15 Bool)
(assert (= en_AT3_prop_AT15 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT4_prop_AT15 Bool)
(assert (= en_AT4_prop_AT15 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT5_prop_AT15 Bool)
(assert (= en_AT5_prop_AT15 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT6_prop_AT15 Bool)
(assert (= en_AT6_prop_AT15 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT7_prop_AT15 Bool)
(assert (= en_AT7_prop_AT15 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT8_prop_AT15 Bool)
(assert (= en_AT8_prop_AT15 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT9_prop_AT15 Bool)
(assert (= en_AT9_prop_AT15 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT10_prop_AT15 Bool)
(assert (= en_AT10_prop_AT15 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT11_prop_AT15 Bool)
(assert (= en_AT11_prop_AT15 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT12_prop_AT15 Bool)
(assert (= en_AT12_prop_AT15 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT13_prop_AT15 Bool)
(assert (= en_AT13_prop_AT15 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT14_prop_AT15 Bool)
(assert (= en_AT14_prop_AT15 (=> (and (= ff_en.Q_AT13 #b0) (= ff_en.Q_AT14 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT13) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const en_AT15_prop_AT15 Bool)
(assert (= en_AT15_prop_AT15 (=> (and (= ff_en.Q_AT14 #b0) (= ff_en.Q_AT15 #b1)) (or (= data_out_vld_AT15 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT14) ((_ extract 2 0) f.ff_rdPtr.Q_AT15))))))

(declare-const temporal_splits_AT15 Bool)
(assert (= temporal_splits_AT15 (and en_AT1_prop_AT15 en_AT2_prop_AT15 en_AT3_prop_AT15 en_AT4_prop_AT15 en_AT5_prop_AT15 en_AT6_prop_AT15 en_AT7_prop_AT15 en_AT8_prop_AT15 en_AT9_prop_AT15 en_AT10_prop_AT15 en_AT11_prop_AT15 en_AT12_prop_AT15 en_AT13_prop_AT15 en_AT14_prop_AT15 en_AT15_prop_AT15)))
(check-sat-assuming ( (not temporal_splits_AT15) ))
;; END

(echo |checking property at 15|)
(check-sat)

(pop 1)
(declare-fun mpt.ff_cnt.Q_AT16 () (_ BitVec 4))
(declare-fun ff_en.Q_AT16 () (_ BitVec 1))
(declare-fun pop_AT16 () (_ BitVec 1))
(declare-fun push_AT16 () (_ BitVec 1))
(declare-fun rst_AT16 () (_ BitVec 1))
(declare-fun prop_signal_AT16 () (_ BitVec 1))
(declare-fun data_out_vld_AT16 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT16 () (_ BitVec 4))
(declare-fun flat_data_in_AT15 () (_ BitVec 8))
(declare-fun f.entries_AT16 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT16 () (_ BitVec 4))
(declare-fun start_AT15 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT16 () (_ BitVec 8))

(assert (= (bvor push_AT16 pop_AT16) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT16) ((_ extract 2 0) f.ff_wrPtr.Q_AT16)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT16) ((_ extract 3 3) f.ff_wrPtr.Q_AT16))))) (bvnot push_AT16)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT16 f.ff_wrPtr.Q_AT16)) (bvnot pop_AT16)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT16) (bvnot #b1)) #b1))
(assert (= prop_signal_AT16 (bvor (bvnot (bvand (bvand ff_en.Q_AT16 (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT16 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16) #b0000)) pop_AT16) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16))) #b0000))))) (bvcomp ff_magic_packet.Q_AT16 (select f.entries_AT16 ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))
(assert (= data_out_vld_AT16 (bvand (bvand ff_en.Q_AT16 (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT16 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16) #b0000)) pop_AT16) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT16 (bvite (bvcomp rst_AT15 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT15 pop_AT15) rst_AT15) #b1) (bvite (bvcomp push_AT15 #b1) (bvadd f.ff_wrPtr.Q_AT15 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT15) f.ff_wrPtr.Q_AT15))))
(assert (= f.entries_AT16 (store f.entries_AT15 ((_ extract 2 0) f.ff_wrPtr.Q_AT15) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (bvite (bvcomp push_AT15 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT15 (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (bvite (bvcomp push_AT15 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT15 ((_ extract 2 0) f.ff_wrPtr.Q_AT15)) (bvnot (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT15 #b1) #b1 #b0) (bvite (bvcomp push_AT15 #b1) #b1 #b0))))))))))) (select f.entries_AT15 ((_ extract 2 0) f.ff_wrPtr.Q_AT15))))))
(assert (= f.ff_rdPtr.Q_AT16 (bvite (bvcomp rst_AT15 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT15 pop_AT15) rst_AT15) #b1) (bvite (bvcomp pop_AT15 #b1) (bvadd f.ff_rdPtr.Q_AT15 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT15) f.ff_rdPtr.Q_AT15))))
(assert (= ff_magic_packet.Q_AT16 (bvite (bvcomp rst_AT15 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT15 push_AT15) (bvnot ff_en.Q_AT15)) #b1) flat_data_in_AT15 ff_magic_packet.Q_AT15))))
(assert (= mpt.ff_cnt.Q_AT16 (bvite (bvcomp rst_AT15 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT15 pop_AT15) rst_AT15) ff_en.Q_AT15) #b1) (bvite (bvcomp rst_AT15 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15) #b0000)) pop_AT15) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT15 #b1000)) push_AT15) (bvnot ff_en.Q_AT15)) #b1) (bvadd mpt.ff_cnt.Q_AT15 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT15))) mpt.ff_cnt.Q_AT15))))
(assert (= ff_en.Q_AT16 (bvite (bvcomp rst_AT15 #b1) #b0 (bvite (bvcomp ff_en.Q_AT15 #b1) #b1 (bvor ff_en.Q_AT15 (bvand start_AT15 push_AT15))))))
(push 1)

(assert (= prop_signal_AT16 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT16 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT16 Bool)
(assert (= en_AT1_prop_AT16 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT2_prop_AT16 Bool)
(assert (= en_AT2_prop_AT16 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT3_prop_AT16 Bool)
(assert (= en_AT3_prop_AT16 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT4_prop_AT16 Bool)
(assert (= en_AT4_prop_AT16 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT5_prop_AT16 Bool)
(assert (= en_AT5_prop_AT16 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT6_prop_AT16 Bool)
(assert (= en_AT6_prop_AT16 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT7_prop_AT16 Bool)
(assert (= en_AT7_prop_AT16 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT8_prop_AT16 Bool)
(assert (= en_AT8_prop_AT16 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT9_prop_AT16 Bool)
(assert (= en_AT9_prop_AT16 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT10_prop_AT16 Bool)
(assert (= en_AT10_prop_AT16 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT11_prop_AT16 Bool)
(assert (= en_AT11_prop_AT16 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT12_prop_AT16 Bool)
(assert (= en_AT12_prop_AT16 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT13_prop_AT16 Bool)
(assert (= en_AT13_prop_AT16 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT14_prop_AT16 Bool)
(assert (= en_AT14_prop_AT16 (=> (and (= ff_en.Q_AT13 #b0) (= ff_en.Q_AT14 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT13) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT15_prop_AT16 Bool)
(assert (= en_AT15_prop_AT16 (=> (and (= ff_en.Q_AT14 #b0) (= ff_en.Q_AT15 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT14) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const en_AT16_prop_AT16 Bool)
(assert (= en_AT16_prop_AT16 (=> (and (= ff_en.Q_AT15 #b0) (= ff_en.Q_AT16 #b1)) (or (= data_out_vld_AT16 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT15) ((_ extract 2 0) f.ff_rdPtr.Q_AT16))))))

(declare-const temporal_splits_AT16 Bool)
(assert (= temporal_splits_AT16 (and en_AT1_prop_AT16 en_AT2_prop_AT16 en_AT3_prop_AT16 en_AT4_prop_AT16 en_AT5_prop_AT16 en_AT6_prop_AT16 en_AT7_prop_AT16 en_AT8_prop_AT16 en_AT9_prop_AT16 en_AT10_prop_AT16 en_AT11_prop_AT16 en_AT12_prop_AT16 en_AT13_prop_AT16 en_AT14_prop_AT16 en_AT15_prop_AT16 en_AT16_prop_AT16)))
(check-sat-assuming ( (not temporal_splits_AT16) ))
;; END

(echo |checking property at 16|)
(check-sat)

(pop 1)
(declare-fun ff_en.Q_AT17 () (_ BitVec 1))
(declare-fun pop_AT17 () (_ BitVec 1))
(declare-fun push_AT17 () (_ BitVec 1))
(declare-fun rst_AT17 () (_ BitVec 1))
(declare-fun prop_signal_AT17 () (_ BitVec 1))
(declare-fun data_out_vld_AT17 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT17 () (_ BitVec 4))
(declare-fun flat_data_in_AT16 () (_ BitVec 8))
(declare-fun f.entries_AT17 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT17 () (_ BitVec 4))
(declare-fun start_AT16 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT17 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT17 () (_ BitVec 4))

(assert (= (bvor push_AT17 pop_AT17) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT17) ((_ extract 2 0) f.ff_wrPtr.Q_AT17)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT17) ((_ extract 3 3) f.ff_wrPtr.Q_AT17))))) (bvnot push_AT17)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT17 f.ff_wrPtr.Q_AT17)) (bvnot pop_AT17)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT17) (bvnot #b1)) #b1))
(assert (= prop_signal_AT17 (bvor (bvnot (bvand (bvand ff_en.Q_AT17 (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT17 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17) #b0000)) pop_AT17) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17))) #b0000))))) (bvcomp ff_magic_packet.Q_AT17 (select f.entries_AT17 ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))
(assert (= data_out_vld_AT17 (bvand (bvand ff_en.Q_AT17 (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT17 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17) #b0000)) pop_AT17) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT17 (bvite (bvcomp rst_AT16 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT16 pop_AT16) rst_AT16) #b1) (bvite (bvcomp push_AT16 #b1) (bvadd f.ff_wrPtr.Q_AT16 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT16) f.ff_wrPtr.Q_AT16))))
(assert (= f.entries_AT17 (store f.entries_AT16 ((_ extract 2 0) f.ff_wrPtr.Q_AT16) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (bvite (bvcomp push_AT16 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT16 (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (bvite (bvcomp push_AT16 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT16 ((_ extract 2 0) f.ff_wrPtr.Q_AT16)) (bvnot (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT16 #b1) #b1 #b0) (bvite (bvcomp push_AT16 #b1) #b1 #b0))))))))))) (select f.entries_AT16 ((_ extract 2 0) f.ff_wrPtr.Q_AT16))))))
(assert (= f.ff_rdPtr.Q_AT17 (bvite (bvcomp rst_AT16 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT16 pop_AT16) rst_AT16) #b1) (bvite (bvcomp pop_AT16 #b1) (bvadd f.ff_rdPtr.Q_AT16 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT16) f.ff_rdPtr.Q_AT16))))
(assert (= ff_magic_packet.Q_AT17 (bvite (bvcomp rst_AT16 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT16 push_AT16) (bvnot ff_en.Q_AT16)) #b1) flat_data_in_AT16 ff_magic_packet.Q_AT16))))
(assert (= mpt.ff_cnt.Q_AT17 (bvite (bvcomp rst_AT16 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT16 pop_AT16) rst_AT16) ff_en.Q_AT16) #b1) (bvite (bvcomp rst_AT16 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16) #b0000)) pop_AT16) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT16 #b1000)) push_AT16) (bvnot ff_en.Q_AT16)) #b1) (bvadd mpt.ff_cnt.Q_AT16 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT16))) mpt.ff_cnt.Q_AT16))))
(assert (= ff_en.Q_AT17 (bvite (bvcomp rst_AT16 #b1) #b0 (bvite (bvcomp ff_en.Q_AT16 #b1) #b1 (bvor ff_en.Q_AT16 (bvand start_AT16 push_AT16))))))
(push 1)

(assert (= prop_signal_AT17 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT17 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT17 Bool)
(assert (= en_AT1_prop_AT17 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT2_prop_AT17 Bool)
(assert (= en_AT2_prop_AT17 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT3_prop_AT17 Bool)
(assert (= en_AT3_prop_AT17 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT4_prop_AT17 Bool)
(assert (= en_AT4_prop_AT17 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT5_prop_AT17 Bool)
(assert (= en_AT5_prop_AT17 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT6_prop_AT17 Bool)
(assert (= en_AT6_prop_AT17 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT7_prop_AT17 Bool)
(assert (= en_AT7_prop_AT17 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT8_prop_AT17 Bool)
(assert (= en_AT8_prop_AT17 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT9_prop_AT17 Bool)
(assert (= en_AT9_prop_AT17 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT10_prop_AT17 Bool)
(assert (= en_AT10_prop_AT17 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT11_prop_AT17 Bool)
(assert (= en_AT11_prop_AT17 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT12_prop_AT17 Bool)
(assert (= en_AT12_prop_AT17 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT13_prop_AT17 Bool)
(assert (= en_AT13_prop_AT17 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT14_prop_AT17 Bool)
(assert (= en_AT14_prop_AT17 (=> (and (= ff_en.Q_AT13 #b0) (= ff_en.Q_AT14 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT13) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT15_prop_AT17 Bool)
(assert (= en_AT15_prop_AT17 (=> (and (= ff_en.Q_AT14 #b0) (= ff_en.Q_AT15 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT14) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT16_prop_AT17 Bool)
(assert (= en_AT16_prop_AT17 (=> (and (= ff_en.Q_AT15 #b0) (= ff_en.Q_AT16 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT15) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const en_AT17_prop_AT17 Bool)
(assert (= en_AT17_prop_AT17 (=> (and (= ff_en.Q_AT16 #b0) (= ff_en.Q_AT17 #b1)) (or (= data_out_vld_AT17 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT16) ((_ extract 2 0) f.ff_rdPtr.Q_AT17))))))

(declare-const temporal_splits_AT17 Bool)
(assert (= temporal_splits_AT17 (and en_AT1_prop_AT17 en_AT2_prop_AT17 en_AT3_prop_AT17 en_AT4_prop_AT17 en_AT5_prop_AT17 en_AT6_prop_AT17 en_AT7_prop_AT17 en_AT8_prop_AT17 en_AT9_prop_AT17 en_AT10_prop_AT17 en_AT11_prop_AT17 en_AT12_prop_AT17 en_AT13_prop_AT17 en_AT14_prop_AT17 en_AT15_prop_AT17 en_AT16_prop_AT17 en_AT17_prop_AT17)))
(check-sat-assuming ( (not temporal_splits_AT17) ))
;; END

(echo |checking property at 17|)
(check-sat)

(pop 1)
(declare-fun ff_en.Q_AT18 () (_ BitVec 1))
(declare-fun pop_AT18 () (_ BitVec 1))
(declare-fun push_AT18 () (_ BitVec 1))
(declare-fun rst_AT18 () (_ BitVec 1))
(declare-fun prop_signal_AT18 () (_ BitVec 1))
(declare-fun data_out_vld_AT18 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT18 () (_ BitVec 4))
(declare-fun flat_data_in_AT17 () (_ BitVec 8))
(declare-fun f.entries_AT18 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT18 () (_ BitVec 4))
(declare-fun start_AT17 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT18 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT18 () (_ BitVec 4))

(assert (= (bvor push_AT18 pop_AT18) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT18) ((_ extract 2 0) f.ff_wrPtr.Q_AT18)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT18) ((_ extract 3 3) f.ff_wrPtr.Q_AT18))))) (bvnot push_AT18)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT18 f.ff_wrPtr.Q_AT18)) (bvnot pop_AT18)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT18) (bvnot #b1)) #b1))
(assert (= prop_signal_AT18 (bvor (bvnot (bvand (bvand ff_en.Q_AT18 (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT18 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18) #b0000)) pop_AT18) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18))) #b0000))))) (bvcomp ff_magic_packet.Q_AT18 (select f.entries_AT18 ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))
(assert (= data_out_vld_AT18 (bvand (bvand ff_en.Q_AT18 (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT18 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18) #b0000)) pop_AT18) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT18 (bvite (bvcomp rst_AT17 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT17 pop_AT17) rst_AT17) #b1) (bvite (bvcomp push_AT17 #b1) (bvadd f.ff_wrPtr.Q_AT17 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT17) f.ff_wrPtr.Q_AT17))))
(assert (= f.entries_AT18 (store f.entries_AT17 ((_ extract 2 0) f.ff_wrPtr.Q_AT17) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (bvite (bvcomp push_AT17 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT17 (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (bvite (bvcomp push_AT17 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT17 ((_ extract 2 0) f.ff_wrPtr.Q_AT17)) (bvnot (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT17 #b1) #b1 #b0) (bvite (bvcomp push_AT17 #b1) #b1 #b0))))))))))) (select f.entries_AT17 ((_ extract 2 0) f.ff_wrPtr.Q_AT17))))))
(assert (= f.ff_rdPtr.Q_AT18 (bvite (bvcomp rst_AT17 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT17 pop_AT17) rst_AT17) #b1) (bvite (bvcomp pop_AT17 #b1) (bvadd f.ff_rdPtr.Q_AT17 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT17) f.ff_rdPtr.Q_AT17))))
(assert (= ff_magic_packet.Q_AT18 (bvite (bvcomp rst_AT17 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT17 push_AT17) (bvnot ff_en.Q_AT17)) #b1) flat_data_in_AT17 ff_magic_packet.Q_AT17))))
(assert (= mpt.ff_cnt.Q_AT18 (bvite (bvcomp rst_AT17 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT17 pop_AT17) rst_AT17) ff_en.Q_AT17) #b1) (bvite (bvcomp rst_AT17 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17) #b0000)) pop_AT17) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT17 #b1000)) push_AT17) (bvnot ff_en.Q_AT17)) #b1) (bvadd mpt.ff_cnt.Q_AT17 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT17))) mpt.ff_cnt.Q_AT17))))
(assert (= ff_en.Q_AT18 (bvite (bvcomp rst_AT17 #b1) #b0 (bvite (bvcomp ff_en.Q_AT17 #b1) #b1 (bvor ff_en.Q_AT17 (bvand start_AT17 push_AT17))))))
(push 1)

(assert (= prop_signal_AT18 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT18 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT18 Bool)
(assert (= en_AT1_prop_AT18 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT2_prop_AT18 Bool)
(assert (= en_AT2_prop_AT18 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT3_prop_AT18 Bool)
(assert (= en_AT3_prop_AT18 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT4_prop_AT18 Bool)
(assert (= en_AT4_prop_AT18 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT5_prop_AT18 Bool)
(assert (= en_AT5_prop_AT18 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT6_prop_AT18 Bool)
(assert (= en_AT6_prop_AT18 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT7_prop_AT18 Bool)
(assert (= en_AT7_prop_AT18 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT8_prop_AT18 Bool)
(assert (= en_AT8_prop_AT18 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT9_prop_AT18 Bool)
(assert (= en_AT9_prop_AT18 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT10_prop_AT18 Bool)
(assert (= en_AT10_prop_AT18 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT11_prop_AT18 Bool)
(assert (= en_AT11_prop_AT18 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT12_prop_AT18 Bool)
(assert (= en_AT12_prop_AT18 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT13_prop_AT18 Bool)
(assert (= en_AT13_prop_AT18 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT14_prop_AT18 Bool)
(assert (= en_AT14_prop_AT18 (=> (and (= ff_en.Q_AT13 #b0) (= ff_en.Q_AT14 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT13) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT15_prop_AT18 Bool)
(assert (= en_AT15_prop_AT18 (=> (and (= ff_en.Q_AT14 #b0) (= ff_en.Q_AT15 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT14) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT16_prop_AT18 Bool)
(assert (= en_AT16_prop_AT18 (=> (and (= ff_en.Q_AT15 #b0) (= ff_en.Q_AT16 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT15) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT17_prop_AT18 Bool)
(assert (= en_AT17_prop_AT18 (=> (and (= ff_en.Q_AT16 #b0) (= ff_en.Q_AT17 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT16) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const en_AT18_prop_AT18 Bool)
(assert (= en_AT18_prop_AT18 (=> (and (= ff_en.Q_AT17 #b0) (= ff_en.Q_AT18 #b1)) (or (= data_out_vld_AT18 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT17) ((_ extract 2 0) f.ff_rdPtr.Q_AT18))))))

(declare-const temporal_splits_AT18 Bool)
(assert (= temporal_splits_AT18 (and en_AT1_prop_AT18 en_AT2_prop_AT18 en_AT3_prop_AT18 en_AT4_prop_AT18 en_AT5_prop_AT18 en_AT6_prop_AT18 en_AT7_prop_AT18 en_AT8_prop_AT18 en_AT9_prop_AT18 en_AT10_prop_AT18 en_AT11_prop_AT18 en_AT12_prop_AT18 en_AT13_prop_AT18 en_AT14_prop_AT18 en_AT15_prop_AT18 en_AT16_prop_AT18 en_AT17_prop_AT18 en_AT18_prop_AT18)))
(check-sat-assuming ( (not temporal_splits_AT18) ))
;; END

(echo |checking property at 18|)
(check-sat)

(pop 1)
(declare-fun pop_AT19 () (_ BitVec 1))
(declare-fun push_AT19 () (_ BitVec 1))
(declare-fun rst_AT19 () (_ BitVec 1))
(declare-fun prop_signal_AT19 () (_ BitVec 1))
(declare-fun data_out_vld_AT19 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT19 () (_ BitVec 4))
(declare-fun flat_data_in_AT18 () (_ BitVec 8))
(declare-fun f.entries_AT19 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT19 () (_ BitVec 4))
(declare-fun start_AT18 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT19 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT19 () (_ BitVec 4))
(declare-fun ff_en.Q_AT19 () (_ BitVec 1))

(assert (= (bvor push_AT19 pop_AT19) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT19) ((_ extract 2 0) f.ff_wrPtr.Q_AT19)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT19) ((_ extract 3 3) f.ff_wrPtr.Q_AT19))))) (bvnot push_AT19)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT19 f.ff_wrPtr.Q_AT19)) (bvnot pop_AT19)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT19) (bvnot #b1)) #b1))
(assert (= prop_signal_AT19 (bvor (bvnot (bvand (bvand ff_en.Q_AT19 (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT19 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19) #b0000)) pop_AT19) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19))) #b0000))))) (bvcomp ff_magic_packet.Q_AT19 (select f.entries_AT19 ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))
(assert (= data_out_vld_AT19 (bvand (bvand ff_en.Q_AT19 (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT19 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19) #b0000)) pop_AT19) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT19 (bvite (bvcomp rst_AT18 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT18 pop_AT18) rst_AT18) #b1) (bvite (bvcomp push_AT18 #b1) (bvadd f.ff_wrPtr.Q_AT18 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT18) f.ff_wrPtr.Q_AT18))))
(assert (= f.entries_AT19 (store f.entries_AT18 ((_ extract 2 0) f.ff_wrPtr.Q_AT18) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (bvite (bvcomp push_AT18 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT18 (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (bvite (bvcomp push_AT18 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT18 ((_ extract 2 0) f.ff_wrPtr.Q_AT18)) (bvnot (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT18 #b1) #b1 #b0) (bvite (bvcomp push_AT18 #b1) #b1 #b0))))))))))) (select f.entries_AT18 ((_ extract 2 0) f.ff_wrPtr.Q_AT18))))))
(assert (= f.ff_rdPtr.Q_AT19 (bvite (bvcomp rst_AT18 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT18 pop_AT18) rst_AT18) #b1) (bvite (bvcomp pop_AT18 #b1) (bvadd f.ff_rdPtr.Q_AT18 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT18) f.ff_rdPtr.Q_AT18))))
(assert (= ff_magic_packet.Q_AT19 (bvite (bvcomp rst_AT18 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT18 push_AT18) (bvnot ff_en.Q_AT18)) #b1) flat_data_in_AT18 ff_magic_packet.Q_AT18))))
(assert (= mpt.ff_cnt.Q_AT19 (bvite (bvcomp rst_AT18 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT18 pop_AT18) rst_AT18) ff_en.Q_AT18) #b1) (bvite (bvcomp rst_AT18 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18) #b0000)) pop_AT18) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT18 #b1000)) push_AT18) (bvnot ff_en.Q_AT18)) #b1) (bvadd mpt.ff_cnt.Q_AT18 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT18))) mpt.ff_cnt.Q_AT18))))
(assert (= ff_en.Q_AT19 (bvite (bvcomp rst_AT18 #b1) #b0 (bvite (bvcomp ff_en.Q_AT18 #b1) #b1 (bvor ff_en.Q_AT18 (bvand start_AT18 push_AT18))))))
(push 1)

(assert (= prop_signal_AT19 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT19 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT19 Bool)
(assert (= en_AT1_prop_AT19 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT2_prop_AT19 Bool)
(assert (= en_AT2_prop_AT19 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT3_prop_AT19 Bool)
(assert (= en_AT3_prop_AT19 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT4_prop_AT19 Bool)
(assert (= en_AT4_prop_AT19 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT5_prop_AT19 Bool)
(assert (= en_AT5_prop_AT19 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT6_prop_AT19 Bool)
(assert (= en_AT6_prop_AT19 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT7_prop_AT19 Bool)
(assert (= en_AT7_prop_AT19 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT8_prop_AT19 Bool)
(assert (= en_AT8_prop_AT19 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT9_prop_AT19 Bool)
(assert (= en_AT9_prop_AT19 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT10_prop_AT19 Bool)
(assert (= en_AT10_prop_AT19 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT11_prop_AT19 Bool)
(assert (= en_AT11_prop_AT19 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT12_prop_AT19 Bool)
(assert (= en_AT12_prop_AT19 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT13_prop_AT19 Bool)
(assert (= en_AT13_prop_AT19 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT14_prop_AT19 Bool)
(assert (= en_AT14_prop_AT19 (=> (and (= ff_en.Q_AT13 #b0) (= ff_en.Q_AT14 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT13) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT15_prop_AT19 Bool)
(assert (= en_AT15_prop_AT19 (=> (and (= ff_en.Q_AT14 #b0) (= ff_en.Q_AT15 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT14) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT16_prop_AT19 Bool)
(assert (= en_AT16_prop_AT19 (=> (and (= ff_en.Q_AT15 #b0) (= ff_en.Q_AT16 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT15) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT17_prop_AT19 Bool)
(assert (= en_AT17_prop_AT19 (=> (and (= ff_en.Q_AT16 #b0) (= ff_en.Q_AT17 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT16) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT18_prop_AT19 Bool)
(assert (= en_AT18_prop_AT19 (=> (and (= ff_en.Q_AT17 #b0) (= ff_en.Q_AT18 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT17) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const en_AT19_prop_AT19 Bool)
(assert (= en_AT19_prop_AT19 (=> (and (= ff_en.Q_AT18 #b0) (= ff_en.Q_AT19 #b1)) (or (= data_out_vld_AT19 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT18) ((_ extract 2 0) f.ff_rdPtr.Q_AT19))))))

(declare-const temporal_splits_AT19 Bool)
(assert (= temporal_splits_AT19 (and en_AT1_prop_AT19 en_AT2_prop_AT19 en_AT3_prop_AT19 en_AT4_prop_AT19 en_AT5_prop_AT19 en_AT6_prop_AT19 en_AT7_prop_AT19 en_AT8_prop_AT19 en_AT9_prop_AT19 en_AT10_prop_AT19 en_AT11_prop_AT19 en_AT12_prop_AT19 en_AT13_prop_AT19 en_AT14_prop_AT19 en_AT15_prop_AT19 en_AT16_prop_AT19 en_AT17_prop_AT19 en_AT18_prop_AT19 en_AT19_prop_AT19)))
(check-sat-assuming ( (not temporal_splits_AT19) ))
;; END

(echo |checking property at 19|)
(check-sat)

(pop 1)
(declare-fun pop_AT20 () (_ BitVec 1))
(declare-fun push_AT20 () (_ BitVec 1))
(declare-fun rst_AT20 () (_ BitVec 1))
(declare-fun prop_signal_AT20 () (_ BitVec 1))
(declare-fun data_out_vld_AT20 () (_ BitVec 1))
(declare-fun f.ff_wrPtr.Q_AT20 () (_ BitVec 4))
(declare-fun flat_data_in_AT19 () (_ BitVec 8))
(declare-fun f.entries_AT20 () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun f.ff_rdPtr.Q_AT20 () (_ BitVec 4))
(declare-fun start_AT19 () (_ BitVec 1))
(declare-fun ff_magic_packet.Q_AT20 () (_ BitVec 8))
(declare-fun mpt.ff_cnt.Q_AT20 () (_ BitVec 4))
(declare-fun ff_en.Q_AT20 () (_ BitVec 1))

(assert (= (bvor push_AT20 pop_AT20) #b1))
(assert true)
(assert (= (bvor (bvor (bvnot (bvand (bvcomp ((_ extract 2 0) f.ff_rdPtr.Q_AT20) ((_ extract 2 0) f.ff_wrPtr.Q_AT20)) (bvnot (bvcomp ((_ extract 3 3) f.ff_rdPtr.Q_AT20) ((_ extract 3 3) f.ff_wrPtr.Q_AT20))))) (bvnot push_AT20)) (bvnot #b1)) #b1))
(assert (= (bvor (bvor (bvnot (bvcomp f.ff_rdPtr.Q_AT20 f.ff_wrPtr.Q_AT20)) (bvnot pop_AT20)) (bvnot #b1)) #b1))
(assert (= (bvor (bvnot rst_AT20) (bvnot #b1)) #b1))
(assert (= prop_signal_AT20 (bvor (bvnot (bvand (bvand ff_en.Q_AT20 (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT20 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b1000)) push_AT20) (bvnot ff_en.Q_AT20)) #b1) (bvadd mpt.ff_cnt.Q_AT20 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT20) #b0000)) pop_AT20) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b1000)) push_AT20) (bvnot ff_en.Q_AT20)) #b1) (bvadd mpt.ff_cnt.Q_AT20 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT20) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b1000)) push_AT20) (bvnot ff_en.Q_AT20)) #b1) (bvadd mpt.ff_cnt.Q_AT20 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT20))) #b0000))))) (bvcomp ff_magic_packet.Q_AT20 (select f.entries_AT20 ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))
(assert (= data_out_vld_AT20 (bvand (bvand ff_en.Q_AT20 (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b0000))) (bvnot (bvnot (bvcomp (bvite (bvcomp rst_AT20 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b1000)) push_AT20) (bvnot ff_en.Q_AT20)) #b1) (bvadd mpt.ff_cnt.Q_AT20 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT20) #b0000)) pop_AT20) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b1000)) push_AT20) (bvnot ff_en.Q_AT20)) #b1) (bvadd mpt.ff_cnt.Q_AT20 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT20) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT20 #b1000)) push_AT20) (bvnot ff_en.Q_AT20)) #b1) (bvadd mpt.ff_cnt.Q_AT20 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT20))) #b0000))))))
(assert (= f.ff_wrPtr.Q_AT20 (bvite (bvcomp rst_AT19 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT19 pop_AT19) rst_AT19) #b1) (bvite (bvcomp push_AT19 #b1) (bvadd f.ff_wrPtr.Q_AT19 ((_ zero_extend 3) #b1)) f.ff_wrPtr.Q_AT19) f.ff_wrPtr.Q_AT19))))
(assert (= f.entries_AT20 (store f.entries_AT19 ((_ extract 2 0) f.ff_wrPtr.Q_AT19) (ite (= (bvnot (bvcomp (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (bvite (bvcomp push_AT19 #b1) #b1 #b0)))))))) #b00000000)) #b1) (bvor (bvand flat_data_in_AT19 (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (bvite (bvcomp push_AT19 #b1) #b1 #b0))))))))) (bvand (select f.entries_AT19 ((_ extract 2 0) f.ff_wrPtr.Q_AT19)) (bvnot (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (concat (bvite (bvcomp push_AT19 #b1) #b1 #b0) (bvite (bvcomp push_AT19 #b1) #b1 #b0))))))))))) (select f.entries_AT19 ((_ extract 2 0) f.ff_wrPtr.Q_AT19))))))
(assert (= f.ff_rdPtr.Q_AT20 (bvite (bvcomp rst_AT19 #b1) #b0000 (bvite (bvcomp (bvor (bvor push_AT19 pop_AT19) rst_AT19) #b1) (bvite (bvcomp pop_AT19 #b1) (bvadd f.ff_rdPtr.Q_AT19 ((_ zero_extend 3) #b1)) f.ff_rdPtr.Q_AT19) f.ff_rdPtr.Q_AT19))))
(assert (= ff_magic_packet.Q_AT20 (bvite (bvcomp rst_AT19 #b1) #b00000000 (bvite (bvcomp (bvand (bvand start_AT19 push_AT19) (bvnot ff_en.Q_AT19)) #b1) flat_data_in_AT19 ff_magic_packet.Q_AT19))))
(assert (= mpt.ff_cnt.Q_AT20 (bvite (bvcomp rst_AT19 #b1) #b0000 (bvite (bvcomp (bvor (bvor (bvor push_AT19 pop_AT19) rst_AT19) ff_en.Q_AT19) #b1) (bvite (bvcomp rst_AT19 #b1) #b0000 (bvite (bvcomp (bvand (bvnot (bvcomp (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19) #b0000)) pop_AT19) #b1) (bvsub (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19) ((_ zero_extend 3) #b1)) (bvite (bvcomp (bvand (bvand (bvnot (bvcomp mpt.ff_cnt.Q_AT19 #b1000)) push_AT19) (bvnot ff_en.Q_AT19)) #b1) (bvadd mpt.ff_cnt.Q_AT19 ((_ zero_extend 3) #b1)) mpt.ff_cnt.Q_AT19))) mpt.ff_cnt.Q_AT19))))
(assert (= ff_en.Q_AT20 (bvite (bvcomp rst_AT19 #b1) #b0 (bvite (bvcomp ff_en.Q_AT19 #b1) #b1 (bvor ff_en.Q_AT19 (bvand start_AT19 push_AT19))))))
(push 1)

(assert (= prop_signal_AT20 #b0))

;; lifted proof
(assert (or (not (= prop_signal_AT20 #b0)) (= (bvand (bvcomp f.ff_wrPtr.Q_AT1 (bvadd f.ff_rdPtr.Q_AT1 mpt.ff_cnt.Q_AT1)) (bvnot ff_en.Q_AT1) (bvor (bvnot ((_ extract 3 3) mpt.ff_cnt.Q_AT1)) (bvcomp ((_ extract 2 0) mpt.ff_cnt.Q_AT1) #b000))) #b0)))

(declare-const en_AT1_prop_AT20 Bool)
(assert (= en_AT1_prop_AT20 (=> (and (= ff_en.Q_AT0 #b0) (= ff_en.Q_AT1 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT0) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT2_prop_AT20 Bool)
(assert (= en_AT2_prop_AT20 (=> (and (= ff_en.Q_AT1 #b0) (= ff_en.Q_AT2 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT1) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT3_prop_AT20 Bool)
(assert (= en_AT3_prop_AT20 (=> (and (= ff_en.Q_AT2 #b0) (= ff_en.Q_AT3 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT2) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT4_prop_AT20 Bool)
(assert (= en_AT4_prop_AT20 (=> (and (= ff_en.Q_AT3 #b0) (= ff_en.Q_AT4 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT3) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT5_prop_AT20 Bool)
(assert (= en_AT5_prop_AT20 (=> (and (= ff_en.Q_AT4 #b0) (= ff_en.Q_AT5 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT4) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT6_prop_AT20 Bool)
(assert (= en_AT6_prop_AT20 (=> (and (= ff_en.Q_AT5 #b0) (= ff_en.Q_AT6 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT5) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT7_prop_AT20 Bool)
(assert (= en_AT7_prop_AT20 (=> (and (= ff_en.Q_AT6 #b0) (= ff_en.Q_AT7 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT6) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT8_prop_AT20 Bool)
(assert (= en_AT8_prop_AT20 (=> (and (= ff_en.Q_AT7 #b0) (= ff_en.Q_AT8 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT7) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT9_prop_AT20 Bool)
(assert (= en_AT9_prop_AT20 (=> (and (= ff_en.Q_AT8 #b0) (= ff_en.Q_AT9 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT8) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT10_prop_AT20 Bool)
(assert (= en_AT10_prop_AT20 (=> (and (= ff_en.Q_AT9 #b0) (= ff_en.Q_AT10 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT9) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT11_prop_AT20 Bool)
(assert (= en_AT11_prop_AT20 (=> (and (= ff_en.Q_AT10 #b0) (= ff_en.Q_AT11 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT10) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT12_prop_AT20 Bool)
(assert (= en_AT12_prop_AT20 (=> (and (= ff_en.Q_AT11 #b0) (= ff_en.Q_AT12 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT11) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT13_prop_AT20 Bool)
(assert (= en_AT13_prop_AT20 (=> (and (= ff_en.Q_AT12 #b0) (= ff_en.Q_AT13 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT12) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT14_prop_AT20 Bool)
(assert (= en_AT14_prop_AT20 (=> (and (= ff_en.Q_AT13 #b0) (= ff_en.Q_AT14 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT13) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT15_prop_AT20 Bool)
(assert (= en_AT15_prop_AT20 (=> (and (= ff_en.Q_AT14 #b0) (= ff_en.Q_AT15 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT14) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT16_prop_AT20 Bool)
(assert (= en_AT16_prop_AT20 (=> (and (= ff_en.Q_AT15 #b0) (= ff_en.Q_AT16 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT15) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT17_prop_AT20 Bool)
(assert (= en_AT17_prop_AT20 (=> (and (= ff_en.Q_AT16 #b0) (= ff_en.Q_AT17 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT16) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT18_prop_AT20 Bool)
(assert (= en_AT18_prop_AT20 (=> (and (= ff_en.Q_AT17 #b0) (= ff_en.Q_AT18 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT17) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT19_prop_AT20 Bool)
(assert (= en_AT19_prop_AT20 (=> (and (= ff_en.Q_AT18 #b0) (= ff_en.Q_AT19 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT18) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const en_AT20_prop_AT20 Bool)
(assert (= en_AT20_prop_AT20 (=> (and (= ff_en.Q_AT19 #b0) (= ff_en.Q_AT20 #b1)) (or (= data_out_vld_AT20 #b0) (= ((_ extract 2 0) f.ff_wrPtr.Q_AT19) ((_ extract 2 0) f.ff_rdPtr.Q_AT20))))))

(declare-const temporal_splits_AT20 Bool)
(assert (= temporal_splits_AT20 (and en_AT1_prop_AT20 en_AT2_prop_AT20 en_AT3_prop_AT20 en_AT4_prop_AT20 en_AT5_prop_AT20 en_AT6_prop_AT20 en_AT7_prop_AT20 en_AT8_prop_AT20 en_AT9_prop_AT20 en_AT10_prop_AT20 en_AT11_prop_AT20 en_AT12_prop_AT20 en_AT13_prop_AT20 en_AT14_prop_AT20 en_AT15_prop_AT20 en_AT16_prop_AT20 en_AT17_prop_AT20 en_AT18_prop_AT20 en_AT19_prop_AT20 en_AT20_prop_AT20)))
(check-sat-assuming ( (not temporal_splits_AT20) ))
;; END

(echo |checking property at 20|)
(check-sat)

(pop 1)