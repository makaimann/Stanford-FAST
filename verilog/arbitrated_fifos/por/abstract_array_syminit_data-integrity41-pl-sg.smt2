(set-logic QF_ABV)
(declare-fun |af.gen_fifos[0].f.empty__AT0| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT0 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.clkEn__AT0| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.D__AT0 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[1]__AT0| () (_ BitVec 8))
(declare-fun start__AT0 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT0| () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT0| () (_ BitVec 8))
(declare-fun sb.ff_magic_packet.en__AT0 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT0 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT0 () (_ BitVec 1))
(declare-fun push__AT0 () (_ BitVec 2))
(declare-fun full__AT0 () (_ BitVec 2))
(declare-fun pop__AT0 () (_ BitVec 2))
(declare-fun data_out_vld__AT0 () (_ BitVec 1))
(declare-fun reqs__AT0 () (_ BitVec 2))
(declare-fun |af.om.interm[0]__AT0| () (_ BitVec 8))
(declare-fun empty__AT0 () (_ BitVec 2))
(declare-fun af.gnt__AT0 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT0| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT0| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT0| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| () (_ BitVec 4))
(declare-fun N25__AT0 () (_ BitVec 2))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT0| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.entries__AT0| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun |af.gen_fifos[1].f.full__AT0| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT0| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT0| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.entries__AT0| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT0| () (_ BitVec 4))
(declare-fun sb.ff_magic_packet.Q__AT0 () (_ BitVec 8))
(declare-fun sb.ff_en.Q__AT0 () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.Q__AT0 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT0| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.clkEn__AT0| () (_ BitVec 1))
(declare-fun data_out__AT0 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT0| () (_ BitVec 4))
(declare-fun rst__AT0 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT0| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT0| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT0| () (_ BitVec 4))
(declare-fun prop_signal__AT0 () (_ BitVec 1))
(declare-fun sb.mpt.ssa_cnt__AT0 () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT0)) (bvnot ((_ extract 1 1) push__AT0))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT0)) (bvnot ((_ extract 0 0) push__AT0))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT0)) (bvnot ((_ extract 0 0) reqs__AT0))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT0)) (bvnot ((_ extract 1 1) reqs__AT0))) #b1))
(assert true)
(assert (= prop_signal__AT0 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT0 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT0 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) #b0000)) ((_ extract 0 0) N25__AT0))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT0 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|)) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) ((_ extract 1 1) N25__AT0))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|)) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) ((_ extract 0 0) N25__AT0))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT0 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))))))
(assert (= sb.mpt.ff_cnt.en__AT0 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT0) ((_ extract 0 0) N25__AT0)) rst__AT0) sb.ff_en.Q__AT0))))
(assert (= sb.mpt.ff_cnt.D__AT0 ((_ zero_extend 0) (ite (= rst__AT0 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) #b0000)) ((_ extract 0 0) N25__AT0))))))))
(assert (= sb.ff_magic_packet.en__AT0 ((_ zero_extend 0) (bvand (bvand start__AT0 ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))))
(assert (= sb.ff_en.en__AT0 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT0))))
(assert (= sb.ff_en.D__AT0 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT0 (bvand start__AT0 ((_ extract 0 0) push__AT0))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT0 #b00)) (bvnot (bvnot (bvcomp N25__AT0 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT0 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT0 reqs__AT0)) ((_ extract 1 1) (bvand N25__AT0 reqs__AT0))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT0 #b00))) (bvand (bvnot (bvcomp N25__AT0 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT0) (bvsub ((_ zero_extend 30) N25__AT0) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT0 ((_ zero_extend 0) N25__AT0)))
(assert (= data_out_vld__AT0 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT0 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT0 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) #b0000)) ((_ extract 0 0) N25__AT0))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT0| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|)) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) ((_ extract 0 0) N25__AT0))))))))))))
(assert (= af.gnt__AT0 ((_ zero_extend 0) N25__AT0)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT0| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT0| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|)))
(assert (= full__AT0 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|)))))))
(assert (= |af.gen_fifos[1].f.full__AT0| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT0| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT0| (concat #b000 ((_ extract 1 1) push__AT0))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT0| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT0| (concat #b000 ((_ extract 1 1) N25__AT0))))))
(assert (= empty__AT0 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT0| |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT0| |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|))))
(assert (= |af.gen_fifos[1].f.empty__AT0| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT0| |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT0| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT0) ((_ extract 1 1) N25__AT0)) rst__AT0))))
(assert (= data_out__AT0 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|)) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) (concat ((_ extract 1 1) N25__AT0) ((_ extract 1 1) N25__AT0))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|)) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) (concat ((_ extract 0 0) N25__AT0) ((_ extract 0 0) N25__AT0))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT0| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT0| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|)))
(assert (= |af.gen_fifos[0].f.full__AT0| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT0| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| (concat #b000 ((_ extract 0 0) push__AT0))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT0| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT0| (concat #b000 ((_ extract 0 0) N25__AT0))))))
(assert (= |af.gen_fifos[0].f.empty__AT0| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT0| |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT0| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT0) ((_ extract 0 0) N25__AT0)) rst__AT0))))
(assert (= |af.fifo_data_out[1]__AT0| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|)))))
(assert (= |af.fifo_data_out[0]__AT0| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|)))))
(assert (bvule sb.mpt.ff_cnt.Q__AT0 #b1000))
(assert (= (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|) sb.mpt.ff_cnt.Q__AT0))
(assert (= sb.ff_en.Q__AT0 #b0))
(assert (= rst__AT0 #b0))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT0 #b1)))
;; Property: END

(echo "Checking property at bound 0")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.wrPtr__AT1| () (_ BitVec 4))
(declare-fun reqs__AT1 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT1| () (_ BitVec 4))
(declare-fun empty__AT1 () (_ BitVec 2))
(declare-fun N25__AT1 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT1| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT1| () (_ BitVec 4))
(declare-fun rst__AT1 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT1| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT1 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT1| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT1| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT1| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT1 () (_ BitVec 1))
(declare-fun data_out__AT1 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT1| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT1| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT1| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT1| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT1| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT1| () (_ BitVec 4))
(declare-fun prop_signal__AT1 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT1| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT1 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT1| () (_ BitVec 1))
(declare-fun flat_data_in__AT0 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT1| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT1 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT1| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT1 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT1| () (_ BitVec 8))
(declare-fun start__AT1 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT1| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT1 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT1 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT1 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT1| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT1 () (_ BitVec 8))
(declare-fun push__AT1 () (_ BitVec 2))
(declare-fun pop__AT1 () (_ BitVec 2))
(declare-fun full__AT1 () (_ BitVec 2))
(declare-fun data_out_vld__AT1 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT1| () (_ BitVec 8))
(declare-fun af.gnt__AT1 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT1)) (bvnot ((_ extract 1 1) push__AT1))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT1)) (bvnot ((_ extract 0 0) push__AT1))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT1)) (bvnot ((_ extract 0 0) reqs__AT1))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT1)) (bvnot ((_ extract 1 1) reqs__AT1))) #b1))
(assert true)
(assert (= prop_signal__AT1 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT1 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT1 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) #b0000)) ((_ extract 0 0) N25__AT1))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT1 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|)) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) ((_ extract 1 1) N25__AT1))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|)) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) ((_ extract 0 0) N25__AT1))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT1 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))))))
(assert (= sb.mpt.ff_cnt.en__AT1 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT1) ((_ extract 0 0) N25__AT1)) rst__AT1) sb.ff_en.Q__AT1))))
(assert (= sb.mpt.ff_cnt.D__AT1 ((_ zero_extend 0) (ite (= rst__AT1 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) #b0000)) ((_ extract 0 0) N25__AT1))))))))
(assert (= sb.ff_magic_packet.en__AT1 ((_ zero_extend 0) (bvand (bvand start__AT1 ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))))
(assert (= sb.ff_en.en__AT1 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT1))))
(assert (= sb.ff_en.D__AT1 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT1 (bvand start__AT1 ((_ extract 0 0) push__AT1))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT1 #b00)) (bvnot (bvnot (bvcomp N25__AT1 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT1 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT1 reqs__AT1)) ((_ extract 1 1) (bvand N25__AT1 reqs__AT1))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT1 #b00))) (bvand (bvnot (bvcomp N25__AT1 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT1) (bvsub ((_ zero_extend 30) N25__AT1) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT1 ((_ zero_extend 0) N25__AT1)))
(assert (= data_out_vld__AT1 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT1 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT1 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) #b0000)) ((_ extract 0 0) N25__AT1))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT1| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|)) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) ((_ extract 0 0) N25__AT1))))))))))))
(assert (= af.gnt__AT1 ((_ zero_extend 0) N25__AT1)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT1| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT1| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|)))
(assert (= full__AT1 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|)))))))
(assert (= |af.gen_fifos[1].f.full__AT1| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT1| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT1| (concat #b000 ((_ extract 1 1) push__AT1))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT1| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT1| (concat #b000 ((_ extract 1 1) N25__AT1))))))
(assert (= empty__AT1 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT1| |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT1| |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|))))
(assert (= |af.gen_fifos[1].f.empty__AT1| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT1| |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT1| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT1) ((_ extract 1 1) N25__AT1)) rst__AT1))))
(assert (= data_out__AT1 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|)) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) (concat ((_ extract 1 1) N25__AT1) ((_ extract 1 1) N25__AT1))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|)) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) (concat ((_ extract 0 0) N25__AT1) ((_ extract 0 0) N25__AT1))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT1| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT1| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|)))
(assert (= |af.gen_fifos[0].f.full__AT1| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT1| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| (concat #b000 ((_ extract 0 0) push__AT1))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT1| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT1| (concat #b000 ((_ extract 0 0) N25__AT1))))))
(assert (= |af.gen_fifos[0].f.empty__AT1| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT1| |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT1| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT1) ((_ extract 0 0) N25__AT1)) rst__AT1))))
(assert (= |af.fifo_data_out[1]__AT1| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|)))))
(assert (= |af.fifo_data_out[0]__AT1| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|)))))
(assert (= rst__AT1 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT1 (ite (= rst__AT0 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT0) ((_ extract 0 0) N25__AT0)) rst__AT0) sb.ff_en.Q__AT0) #b1) (ite (= rst__AT0 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT0 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT0 #b1000)) ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)))) #b0000)) ((_ extract 0 0) N25__AT0))))) sb.mpt.ff_cnt.Q__AT0))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT1| (ite (= rst__AT0 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT0) ((_ extract 0 0) N25__AT0)) rst__AT0) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT0| (concat #b000 ((_ extract 0 0) N25__AT0))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT0|))))
(assert (= sb.ff_en.Q__AT1 (ite (= rst__AT0 #b1) #b0 (ite (= sb.ff_en.Q__AT0 #b1) #b1 (bvor sb.ff_en.Q__AT0 (bvand start__AT0 ((_ extract 0 0) push__AT0)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| (ite (= rst__AT0 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT0) ((_ extract 0 0) N25__AT0)) rst__AT0) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| (concat #b000 ((_ extract 0 0) push__AT0))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT1| (ite (= rst__AT0 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT0) ((_ extract 1 1) N25__AT0)) rst__AT0) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT0| (concat #b000 ((_ extract 1 1) N25__AT0))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT0|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT1| (ite (= rst__AT0 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT0) ((_ extract 1 1) N25__AT0)) rst__AT0) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT0| (concat #b000 ((_ extract 1 1) push__AT0))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|))))
(assert (= |af.gen_fifos[1].f.entries__AT1| (store |af.gen_fifos[1].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|) (bvor (bvand (concat ((_ extract 1 1) push__AT0) (concat ((_ extract 1 1) push__AT0) (concat ((_ extract 1 1) push__AT0) (concat ((_ extract 1 1) push__AT0) (concat ((_ extract 1 1) push__AT0) (concat ((_ extract 1 1) push__AT0) (concat ((_ extract 1 1) push__AT0) ((_ extract 1 1) push__AT0)))))))) ((_ extract 15 8) flat_data_in__AT0)) (bvand (concat (bvnot ((_ extract 1 1) push__AT0)) (concat (bvnot ((_ extract 1 1) push__AT0)) (concat (bvnot ((_ extract 1 1) push__AT0)) (concat (bvnot ((_ extract 1 1) push__AT0)) (concat (bvnot ((_ extract 1 1) push__AT0)) (concat (bvnot ((_ extract 1 1) push__AT0)) (concat (bvnot ((_ extract 1 1) push__AT0)) (bvnot ((_ extract 1 1) push__AT0))))))))) (select |af.gen_fifos[1].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT0|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT1| (store |af.gen_fifos[0].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|) (bvor (bvand (concat ((_ extract 0 0) push__AT0) (concat ((_ extract 0 0) push__AT0) (concat ((_ extract 0 0) push__AT0) (concat ((_ extract 0 0) push__AT0) (concat ((_ extract 0 0) push__AT0) (concat ((_ extract 0 0) push__AT0) (concat ((_ extract 0 0) push__AT0) ((_ extract 0 0) push__AT0)))))))) ((_ extract 7 0) flat_data_in__AT0)) (bvand (concat (bvnot ((_ extract 0 0) push__AT0)) (concat (bvnot ((_ extract 0 0) push__AT0)) (concat (bvnot ((_ extract 0 0) push__AT0)) (concat (bvnot ((_ extract 0 0) push__AT0)) (concat (bvnot ((_ extract 0 0) push__AT0)) (concat (bvnot ((_ extract 0 0) push__AT0)) (concat (bvnot ((_ extract 0 0) push__AT0)) (bvnot ((_ extract 0 0) push__AT0))))))))) (select |af.gen_fifos[0].f.entries__AT0| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT0|)))))))
(assert (= sb.ff_magic_packet.Q__AT1 (ite (= rst__AT0 #b1) #b00000000 (ite (= (bvand (bvand start__AT0 ((_ extract 0 0) push__AT0)) (bvnot sb.ff_en.Q__AT0)) #b1) ((_ extract 7 0) flat_data_in__AT0) sb.ff_magic_packet.Q__AT0))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT1 #b1)))
;; Property: END

(echo "Checking property at bound 1")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.empty__AT2| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT2| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT2| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT2 () (_ BitVec 1))
(declare-fun data_out__AT2 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT2| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT2| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT2| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT2| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT2| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT2| () (_ BitVec 4))
(declare-fun prop_signal__AT2 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT2| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT2 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT2| () (_ BitVec 1))
(declare-fun flat_data_in__AT1 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT2| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT2 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT2| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT2 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT2| () (_ BitVec 8))
(declare-fun start__AT2 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT2| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT2 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT2 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT2 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT2| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT2 () (_ BitVec 8))
(declare-fun push__AT2 () (_ BitVec 2))
(declare-fun pop__AT2 () (_ BitVec 2))
(declare-fun full__AT2 () (_ BitVec 2))
(declare-fun data_out_vld__AT2 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT2| () (_ BitVec 8))
(declare-fun af.gnt__AT2 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT2| () (_ BitVec 4))
(declare-fun reqs__AT2 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT2| () (_ BitVec 4))
(declare-fun empty__AT2 () (_ BitVec 2))
(declare-fun N25__AT2 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT2| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT2| () (_ BitVec 4))
(declare-fun rst__AT2 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT2| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT2 () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT2)) (bvnot ((_ extract 1 1) push__AT2))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT2)) (bvnot ((_ extract 0 0) push__AT2))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT2)) (bvnot ((_ extract 0 0) reqs__AT2))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT2)) (bvnot ((_ extract 1 1) reqs__AT2))) #b1))
(assert true)
(assert (= prop_signal__AT2 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT2 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT2 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) #b0000)) ((_ extract 0 0) N25__AT2))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT2 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|)) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) ((_ extract 1 1) N25__AT2))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|)) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) ((_ extract 0 0) N25__AT2))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT2 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))))))
(assert (= sb.mpt.ff_cnt.en__AT2 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT2) ((_ extract 0 0) N25__AT2)) rst__AT2) sb.ff_en.Q__AT2))))
(assert (= sb.mpt.ff_cnt.D__AT2 ((_ zero_extend 0) (ite (= rst__AT2 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) #b0000)) ((_ extract 0 0) N25__AT2))))))))
(assert (= sb.ff_magic_packet.en__AT2 ((_ zero_extend 0) (bvand (bvand start__AT2 ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))))
(assert (= sb.ff_en.en__AT2 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT2))))
(assert (= sb.ff_en.D__AT2 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT2 (bvand start__AT2 ((_ extract 0 0) push__AT2))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT2 #b00)) (bvnot (bvnot (bvcomp N25__AT2 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT2 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT2 reqs__AT2)) ((_ extract 1 1) (bvand N25__AT2 reqs__AT2))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT2 #b00))) (bvand (bvnot (bvcomp N25__AT2 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT2) (bvsub ((_ zero_extend 30) N25__AT2) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT2 ((_ zero_extend 0) N25__AT2)))
(assert (= data_out_vld__AT2 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT2 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT2 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) #b0000)) ((_ extract 0 0) N25__AT2))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT2| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|)) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) ((_ extract 0 0) N25__AT2))))))))))))
(assert (= af.gnt__AT2 ((_ zero_extend 0) N25__AT2)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT2| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT2| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|)))
(assert (= full__AT2 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|)))))))
(assert (= |af.gen_fifos[1].f.full__AT2| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT2| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT2| (concat #b000 ((_ extract 1 1) push__AT2))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT2| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT2| (concat #b000 ((_ extract 1 1) N25__AT2))))))
(assert (= empty__AT2 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT2| |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT2| |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|))))
(assert (= |af.gen_fifos[1].f.empty__AT2| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT2| |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT2| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT2) ((_ extract 1 1) N25__AT2)) rst__AT2))))
(assert (= data_out__AT2 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|)) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) (concat ((_ extract 1 1) N25__AT2) ((_ extract 1 1) N25__AT2))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|)) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) (concat ((_ extract 0 0) N25__AT2) ((_ extract 0 0) N25__AT2))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT2| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT2| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|)))
(assert (= |af.gen_fifos[0].f.full__AT2| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT2| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| (concat #b000 ((_ extract 0 0) push__AT2))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT2| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT2| (concat #b000 ((_ extract 0 0) N25__AT2))))))
(assert (= |af.gen_fifos[0].f.empty__AT2| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT2| |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT2| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT2) ((_ extract 0 0) N25__AT2)) rst__AT2))))
(assert (= |af.fifo_data_out[1]__AT2| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|)))))
(assert (= |af.fifo_data_out[0]__AT2| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|)))))
(assert (= rst__AT2 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT2 (ite (= rst__AT1 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT1) ((_ extract 0 0) N25__AT1)) rst__AT1) sb.ff_en.Q__AT1) #b1) (ite (= rst__AT1 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT1 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT1 #b1000)) ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)))) #b0000)) ((_ extract 0 0) N25__AT1))))) sb.mpt.ff_cnt.Q__AT1))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT2| (ite (= rst__AT1 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT1) ((_ extract 0 0) N25__AT1)) rst__AT1) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT1| (concat #b000 ((_ extract 0 0) N25__AT1))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))))
(assert (= sb.ff_en.Q__AT2 (ite (= rst__AT1 #b1) #b0 (ite (= sb.ff_en.Q__AT1 #b1) #b1 (bvor sb.ff_en.Q__AT1 (bvand start__AT1 ((_ extract 0 0) push__AT1)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| (ite (= rst__AT1 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT1) ((_ extract 0 0) N25__AT1)) rst__AT1) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| (concat #b000 ((_ extract 0 0) push__AT1))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT2| (ite (= rst__AT1 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT1) ((_ extract 1 1) N25__AT1)) rst__AT1) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT1| (concat #b000 ((_ extract 1 1) N25__AT1))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT1|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT2| (ite (= rst__AT1 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT1) ((_ extract 1 1) N25__AT1)) rst__AT1) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT1| (concat #b000 ((_ extract 1 1) push__AT1))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|))))
(assert (= |af.gen_fifos[1].f.entries__AT2| (store |af.gen_fifos[1].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|) (bvor (bvand (concat ((_ extract 1 1) push__AT1) (concat ((_ extract 1 1) push__AT1) (concat ((_ extract 1 1) push__AT1) (concat ((_ extract 1 1) push__AT1) (concat ((_ extract 1 1) push__AT1) (concat ((_ extract 1 1) push__AT1) (concat ((_ extract 1 1) push__AT1) ((_ extract 1 1) push__AT1)))))))) ((_ extract 15 8) flat_data_in__AT1)) (bvand (concat (bvnot ((_ extract 1 1) push__AT1)) (concat (bvnot ((_ extract 1 1) push__AT1)) (concat (bvnot ((_ extract 1 1) push__AT1)) (concat (bvnot ((_ extract 1 1) push__AT1)) (concat (bvnot ((_ extract 1 1) push__AT1)) (concat (bvnot ((_ extract 1 1) push__AT1)) (concat (bvnot ((_ extract 1 1) push__AT1)) (bvnot ((_ extract 1 1) push__AT1))))))))) (select |af.gen_fifos[1].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT1|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT2| (store |af.gen_fifos[0].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|) (bvor (bvand (concat ((_ extract 0 0) push__AT1) (concat ((_ extract 0 0) push__AT1) (concat ((_ extract 0 0) push__AT1) (concat ((_ extract 0 0) push__AT1) (concat ((_ extract 0 0) push__AT1) (concat ((_ extract 0 0) push__AT1) (concat ((_ extract 0 0) push__AT1) ((_ extract 0 0) push__AT1)))))))) ((_ extract 7 0) flat_data_in__AT1)) (bvand (concat (bvnot ((_ extract 0 0) push__AT1)) (concat (bvnot ((_ extract 0 0) push__AT1)) (concat (bvnot ((_ extract 0 0) push__AT1)) (concat (bvnot ((_ extract 0 0) push__AT1)) (concat (bvnot ((_ extract 0 0) push__AT1)) (concat (bvnot ((_ extract 0 0) push__AT1)) (concat (bvnot ((_ extract 0 0) push__AT1)) (bvnot ((_ extract 0 0) push__AT1))))))))) (select |af.gen_fifos[0].f.entries__AT1| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT1|)))))))
(assert (= sb.ff_magic_packet.Q__AT2 (ite (= rst__AT1 #b1) #b00000000 (ite (= (bvand (bvand start__AT1 ((_ extract 0 0) push__AT1)) (bvnot sb.ff_en.Q__AT1)) #b1) ((_ extract 7 0) flat_data_in__AT1) sb.ff_magic_packet.Q__AT1))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT2 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop2 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT2 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|))))

(define-fun en2_prop2 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT2 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|))))

(check-sat-assuming ((not (and en1_prop2 en2_prop2))))



(echo "Checking property at bound 2")

(check-sat)

(pop 1)
(declare-fun push__AT3 () (_ BitVec 2))
(declare-fun pop__AT3 () (_ BitVec 2))
(declare-fun full__AT3 () (_ BitVec 2))
(declare-fun data_out_vld__AT3 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT3| () (_ BitVec 8))
(declare-fun af.gnt__AT3 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT3| () (_ BitVec 4))
(declare-fun reqs__AT3 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT3| () (_ BitVec 4))
(declare-fun empty__AT3 () (_ BitVec 2))
(declare-fun N25__AT3 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT3| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT3| () (_ BitVec 4))
(declare-fun rst__AT3 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT3| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT3 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT3| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT3| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT3| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT3 () (_ BitVec 1))
(declare-fun data_out__AT3 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT3| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT3| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT3| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT3| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT3| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT3| () (_ BitVec 4))
(declare-fun prop_signal__AT3 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT3| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT3 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT3| () (_ BitVec 1))
(declare-fun flat_data_in__AT2 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT3| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT3 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT3| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT3 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT3| () (_ BitVec 8))
(declare-fun start__AT3 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT3| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT3 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT3 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT3 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT3| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT3 () (_ BitVec 8))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT3)) (bvnot ((_ extract 1 1) push__AT3))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT3)) (bvnot ((_ extract 0 0) push__AT3))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT3)) (bvnot ((_ extract 0 0) reqs__AT3))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT3)) (bvnot ((_ extract 1 1) reqs__AT3))) #b1))
(assert true)
(assert (= prop_signal__AT3 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT3 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT3 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) #b0000)) ((_ extract 0 0) N25__AT3))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT3 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|)) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) ((_ extract 1 1) N25__AT3))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|)) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) ((_ extract 0 0) N25__AT3))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT3 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))))))
(assert (= sb.mpt.ff_cnt.en__AT3 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT3) ((_ extract 0 0) N25__AT3)) rst__AT3) sb.ff_en.Q__AT3))))
(assert (= sb.mpt.ff_cnt.D__AT3 ((_ zero_extend 0) (ite (= rst__AT3 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) #b0000)) ((_ extract 0 0) N25__AT3))))))))
(assert (= sb.ff_magic_packet.en__AT3 ((_ zero_extend 0) (bvand (bvand start__AT3 ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))))
(assert (= sb.ff_en.en__AT3 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT3))))
(assert (= sb.ff_en.D__AT3 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT3 (bvand start__AT3 ((_ extract 0 0) push__AT3))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT3 #b00)) (bvnot (bvnot (bvcomp N25__AT3 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT3 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT3 reqs__AT3)) ((_ extract 1 1) (bvand N25__AT3 reqs__AT3))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT3 #b00))) (bvand (bvnot (bvcomp N25__AT3 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT3) (bvsub ((_ zero_extend 30) N25__AT3) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT3 ((_ zero_extend 0) N25__AT3)))
(assert (= data_out_vld__AT3 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT3 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT3 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) #b0000)) ((_ extract 0 0) N25__AT3))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT3| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|)) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) ((_ extract 0 0) N25__AT3))))))))))))
(assert (= af.gnt__AT3 ((_ zero_extend 0) N25__AT3)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT3| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT3| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|)))
(assert (= full__AT3 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|)))))))
(assert (= |af.gen_fifos[1].f.full__AT3| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT3| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT3| (concat #b000 ((_ extract 1 1) push__AT3))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT3| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT3| (concat #b000 ((_ extract 1 1) N25__AT3))))))
(assert (= empty__AT3 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT3| |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT3| |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|))))
(assert (= |af.gen_fifos[1].f.empty__AT3| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT3| |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT3| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT3) ((_ extract 1 1) N25__AT3)) rst__AT3))))
(assert (= data_out__AT3 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|)) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) (concat ((_ extract 1 1) N25__AT3) ((_ extract 1 1) N25__AT3))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|)) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) (concat ((_ extract 0 0) N25__AT3) ((_ extract 0 0) N25__AT3))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT3| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT3| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|)))
(assert (= |af.gen_fifos[0].f.full__AT3| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT3| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| (concat #b000 ((_ extract 0 0) push__AT3))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT3| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT3| (concat #b000 ((_ extract 0 0) N25__AT3))))))
(assert (= |af.gen_fifos[0].f.empty__AT3| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT3| |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT3| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT3) ((_ extract 0 0) N25__AT3)) rst__AT3))))
(assert (= |af.fifo_data_out[1]__AT3| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|)))))
(assert (= |af.fifo_data_out[0]__AT3| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|)))))
(assert (= rst__AT3 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT3 (ite (= rst__AT2 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT2) ((_ extract 0 0) N25__AT2)) rst__AT2) sb.ff_en.Q__AT2) #b1) (ite (= rst__AT2 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT2 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT2 #b1000)) ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)))) #b0000)) ((_ extract 0 0) N25__AT2))))) sb.mpt.ff_cnt.Q__AT2))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT3| (ite (= rst__AT2 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT2) ((_ extract 0 0) N25__AT2)) rst__AT2) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT2| (concat #b000 ((_ extract 0 0) N25__AT2))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT2|))))
(assert (= sb.ff_en.Q__AT3 (ite (= rst__AT2 #b1) #b0 (ite (= sb.ff_en.Q__AT2 #b1) #b1 (bvor sb.ff_en.Q__AT2 (bvand start__AT2 ((_ extract 0 0) push__AT2)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| (ite (= rst__AT2 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT2) ((_ extract 0 0) N25__AT2)) rst__AT2) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| (concat #b000 ((_ extract 0 0) push__AT2))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT3| (ite (= rst__AT2 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT2) ((_ extract 1 1) N25__AT2)) rst__AT2) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT2| (concat #b000 ((_ extract 1 1) N25__AT2))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT2|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT3| (ite (= rst__AT2 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT2) ((_ extract 1 1) N25__AT2)) rst__AT2) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT2| (concat #b000 ((_ extract 1 1) push__AT2))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|))))
(assert (= |af.gen_fifos[1].f.entries__AT3| (store |af.gen_fifos[1].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|) (bvor (bvand (concat ((_ extract 1 1) push__AT2) (concat ((_ extract 1 1) push__AT2) (concat ((_ extract 1 1) push__AT2) (concat ((_ extract 1 1) push__AT2) (concat ((_ extract 1 1) push__AT2) (concat ((_ extract 1 1) push__AT2) (concat ((_ extract 1 1) push__AT2) ((_ extract 1 1) push__AT2)))))))) ((_ extract 15 8) flat_data_in__AT2)) (bvand (concat (bvnot ((_ extract 1 1) push__AT2)) (concat (bvnot ((_ extract 1 1) push__AT2)) (concat (bvnot ((_ extract 1 1) push__AT2)) (concat (bvnot ((_ extract 1 1) push__AT2)) (concat (bvnot ((_ extract 1 1) push__AT2)) (concat (bvnot ((_ extract 1 1) push__AT2)) (concat (bvnot ((_ extract 1 1) push__AT2)) (bvnot ((_ extract 1 1) push__AT2))))))))) (select |af.gen_fifos[1].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT2|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT3| (store |af.gen_fifos[0].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|) (bvor (bvand (concat ((_ extract 0 0) push__AT2) (concat ((_ extract 0 0) push__AT2) (concat ((_ extract 0 0) push__AT2) (concat ((_ extract 0 0) push__AT2) (concat ((_ extract 0 0) push__AT2) (concat ((_ extract 0 0) push__AT2) (concat ((_ extract 0 0) push__AT2) ((_ extract 0 0) push__AT2)))))))) ((_ extract 7 0) flat_data_in__AT2)) (bvand (concat (bvnot ((_ extract 0 0) push__AT2)) (concat (bvnot ((_ extract 0 0) push__AT2)) (concat (bvnot ((_ extract 0 0) push__AT2)) (concat (bvnot ((_ extract 0 0) push__AT2)) (concat (bvnot ((_ extract 0 0) push__AT2)) (concat (bvnot ((_ extract 0 0) push__AT2)) (concat (bvnot ((_ extract 0 0) push__AT2)) (bvnot ((_ extract 0 0) push__AT2))))))))) (select |af.gen_fifos[0].f.entries__AT2| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT2|)))))))
(assert (= sb.ff_magic_packet.Q__AT3 (ite (= rst__AT2 #b1) #b00000000 (ite (= (bvand (bvand start__AT2 ((_ extract 0 0) push__AT2)) (bvnot sb.ff_en.Q__AT2)) #b1) ((_ extract 7 0) flat_data_in__AT2) sb.ff_magic_packet.Q__AT2))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT3 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop3 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT3 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|))))

(define-fun en2_prop3 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT3 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|))))

(define-fun en3_prop3 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT3 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|))))

(check-sat-assuming ((not (and en1_prop3 en2_prop3 en3_prop3))))



(echo "Checking property at bound 3")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT4| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT4| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT4| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT4| () (_ BitVec 4))
(declare-fun prop_signal__AT4 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT4| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT4 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT4| () (_ BitVec 1))
(declare-fun flat_data_in__AT3 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT4| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT4 () (_ BitVec 1))
(declare-fun data_out__AT4 () (_ BitVec 8))
(declare-fun |af.fifo_data_out[1]__AT4| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT4 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT4| () (_ BitVec 8))
(declare-fun start__AT4 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT4 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT4| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.en__AT4 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT4 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT4| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT4 () (_ BitVec 8))
(declare-fun push__AT4 () (_ BitVec 2))
(declare-fun pop__AT4 () (_ BitVec 2))
(declare-fun full__AT4 () (_ BitVec 2))
(declare-fun data_out_vld__AT4 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT4| () (_ BitVec 8))
(declare-fun af.gnt__AT4 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT4| () (_ BitVec 4))
(declare-fun reqs__AT4 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT4| () (_ BitVec 4))
(declare-fun empty__AT4 () (_ BitVec 2))
(declare-fun N25__AT4 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT4| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT4| () (_ BitVec 4))
(declare-fun rst__AT4 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT4| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT4 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT4| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT4| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT4| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT4 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT4| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT4| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT4)) (bvnot ((_ extract 1 1) push__AT4))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT4)) (bvnot ((_ extract 0 0) push__AT4))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT4)) (bvnot ((_ extract 0 0) reqs__AT4))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT4)) (bvnot ((_ extract 1 1) reqs__AT4))) #b1))
(assert true)
(assert (= prop_signal__AT4 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT4 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT4 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) #b0000)) ((_ extract 0 0) N25__AT4))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT4 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|)) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) ((_ extract 1 1) N25__AT4))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|)) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) ((_ extract 0 0) N25__AT4))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT4 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))))))
(assert (= sb.mpt.ff_cnt.en__AT4 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT4) ((_ extract 0 0) N25__AT4)) rst__AT4) sb.ff_en.Q__AT4))))
(assert (= sb.mpt.ff_cnt.D__AT4 ((_ zero_extend 0) (ite (= rst__AT4 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) #b0000)) ((_ extract 0 0) N25__AT4))))))))
(assert (= sb.ff_magic_packet.en__AT4 ((_ zero_extend 0) (bvand (bvand start__AT4 ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))))
(assert (= sb.ff_en.en__AT4 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT4))))
(assert (= sb.ff_en.D__AT4 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT4 (bvand start__AT4 ((_ extract 0 0) push__AT4))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT4 #b00)) (bvnot (bvnot (bvcomp N25__AT4 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT4 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT4 reqs__AT4)) ((_ extract 1 1) (bvand N25__AT4 reqs__AT4))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT4 #b00))) (bvand (bvnot (bvcomp N25__AT4 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT4) (bvsub ((_ zero_extend 30) N25__AT4) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT4 ((_ zero_extend 0) N25__AT4)))
(assert (= data_out_vld__AT4 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT4 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT4 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) #b0000)) ((_ extract 0 0) N25__AT4))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT4| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|)) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) ((_ extract 0 0) N25__AT4))))))))))))
(assert (= af.gnt__AT4 ((_ zero_extend 0) N25__AT4)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT4| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT4| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|)))
(assert (= full__AT4 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|)))))))
(assert (= |af.gen_fifos[1].f.full__AT4| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT4| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT4| (concat #b000 ((_ extract 1 1) push__AT4))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT4| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT4| (concat #b000 ((_ extract 1 1) N25__AT4))))))
(assert (= empty__AT4 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT4| |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT4| |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|))))
(assert (= |af.gen_fifos[1].f.empty__AT4| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT4| |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT4| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT4) ((_ extract 1 1) N25__AT4)) rst__AT4))))
(assert (= data_out__AT4 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|)) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) (concat ((_ extract 1 1) N25__AT4) ((_ extract 1 1) N25__AT4))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|)) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) (concat ((_ extract 0 0) N25__AT4) ((_ extract 0 0) N25__AT4))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT4| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT4| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|)))
(assert (= |af.gen_fifos[0].f.full__AT4| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT4| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| (concat #b000 ((_ extract 0 0) push__AT4))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT4| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT4| (concat #b000 ((_ extract 0 0) N25__AT4))))))
(assert (= |af.gen_fifos[0].f.empty__AT4| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT4| |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT4| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT4) ((_ extract 0 0) N25__AT4)) rst__AT4))))
(assert (= |af.fifo_data_out[1]__AT4| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|)))))
(assert (= |af.fifo_data_out[0]__AT4| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|)))))
(assert (= rst__AT4 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT4 (ite (= rst__AT3 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT3) ((_ extract 0 0) N25__AT3)) rst__AT3) sb.ff_en.Q__AT3) #b1) (ite (= rst__AT3 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT3 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT3 #b1000)) ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)))) #b0000)) ((_ extract 0 0) N25__AT3))))) sb.mpt.ff_cnt.Q__AT3))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT4| (ite (= rst__AT3 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT3) ((_ extract 0 0) N25__AT3)) rst__AT3) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT3| (concat #b000 ((_ extract 0 0) N25__AT3))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT3|))))
(assert (= sb.ff_en.Q__AT4 (ite (= rst__AT3 #b1) #b0 (ite (= sb.ff_en.Q__AT3 #b1) #b1 (bvor sb.ff_en.Q__AT3 (bvand start__AT3 ((_ extract 0 0) push__AT3)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| (ite (= rst__AT3 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT3) ((_ extract 0 0) N25__AT3)) rst__AT3) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| (concat #b000 ((_ extract 0 0) push__AT3))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT4| (ite (= rst__AT3 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT3) ((_ extract 1 1) N25__AT3)) rst__AT3) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT3| (concat #b000 ((_ extract 1 1) N25__AT3))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT3|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT4| (ite (= rst__AT3 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT3) ((_ extract 1 1) N25__AT3)) rst__AT3) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT3| (concat #b000 ((_ extract 1 1) push__AT3))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|))))
(assert (= |af.gen_fifos[1].f.entries__AT4| (store |af.gen_fifos[1].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|) (bvor (bvand (concat ((_ extract 1 1) push__AT3) (concat ((_ extract 1 1) push__AT3) (concat ((_ extract 1 1) push__AT3) (concat ((_ extract 1 1) push__AT3) (concat ((_ extract 1 1) push__AT3) (concat ((_ extract 1 1) push__AT3) (concat ((_ extract 1 1) push__AT3) ((_ extract 1 1) push__AT3)))))))) ((_ extract 15 8) flat_data_in__AT3)) (bvand (concat (bvnot ((_ extract 1 1) push__AT3)) (concat (bvnot ((_ extract 1 1) push__AT3)) (concat (bvnot ((_ extract 1 1) push__AT3)) (concat (bvnot ((_ extract 1 1) push__AT3)) (concat (bvnot ((_ extract 1 1) push__AT3)) (concat (bvnot ((_ extract 1 1) push__AT3)) (concat (bvnot ((_ extract 1 1) push__AT3)) (bvnot ((_ extract 1 1) push__AT3))))))))) (select |af.gen_fifos[1].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT3|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT4| (store |af.gen_fifos[0].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|) (bvor (bvand (concat ((_ extract 0 0) push__AT3) (concat ((_ extract 0 0) push__AT3) (concat ((_ extract 0 0) push__AT3) (concat ((_ extract 0 0) push__AT3) (concat ((_ extract 0 0) push__AT3) (concat ((_ extract 0 0) push__AT3) (concat ((_ extract 0 0) push__AT3) ((_ extract 0 0) push__AT3)))))))) ((_ extract 7 0) flat_data_in__AT3)) (bvand (concat (bvnot ((_ extract 0 0) push__AT3)) (concat (bvnot ((_ extract 0 0) push__AT3)) (concat (bvnot ((_ extract 0 0) push__AT3)) (concat (bvnot ((_ extract 0 0) push__AT3)) (concat (bvnot ((_ extract 0 0) push__AT3)) (concat (bvnot ((_ extract 0 0) push__AT3)) (concat (bvnot ((_ extract 0 0) push__AT3)) (bvnot ((_ extract 0 0) push__AT3))))))))) (select |af.gen_fifos[0].f.entries__AT3| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT3|)))))))
(assert (= sb.ff_magic_packet.Q__AT4 (ite (= rst__AT3 #b1) #b00000000 (ite (= (bvand (bvand start__AT3 ((_ extract 0 0) push__AT3)) (bvnot sb.ff_en.Q__AT3)) #b1) ((_ extract 7 0) flat_data_in__AT3) sb.ff_magic_packet.Q__AT3))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT4 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop4 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT4 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|))))

(define-fun en2_prop4 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT4 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|))))

(define-fun en3_prop4 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT4 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|))))

(define-fun en4_prop4 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT4 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|))))

(check-sat-assuming ((not (and en1_prop4 en2_prop4 en3_prop4 en4_prop4))))



(echo "Checking property at bound 4")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.wrPtr__AT5| () (_ BitVec 4))
(declare-fun reqs__AT5 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT5| () (_ BitVec 4))
(declare-fun empty__AT5 () (_ BitVec 2))
(declare-fun N25__AT5 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT5| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT5| () (_ BitVec 4))
(declare-fun rst__AT5 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT5| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT5 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT5| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT5| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT5| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT5 () (_ BitVec 1))
(declare-fun data_out__AT5 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT5| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT5| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT5| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT5| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT5| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT5| () (_ BitVec 4))
(declare-fun prop_signal__AT5 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT5| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT5 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT5| () (_ BitVec 1))
(declare-fun flat_data_in__AT4 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT5| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT5 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT5| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT5 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT5| () (_ BitVec 8))
(declare-fun start__AT5 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT5| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT5 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT5 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT5 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT5| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT5 () (_ BitVec 8))
(declare-fun push__AT5 () (_ BitVec 2))
(declare-fun pop__AT5 () (_ BitVec 2))
(declare-fun full__AT5 () (_ BitVec 2))
(declare-fun data_out_vld__AT5 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT5| () (_ BitVec 8))
(declare-fun af.gnt__AT5 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT5)) (bvnot ((_ extract 1 1) push__AT5))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT5)) (bvnot ((_ extract 0 0) push__AT5))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT5)) (bvnot ((_ extract 0 0) reqs__AT5))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT5)) (bvnot ((_ extract 1 1) reqs__AT5))) #b1))
(assert true)
(assert (= prop_signal__AT5 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT5 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT5 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) #b0000)) ((_ extract 0 0) N25__AT5))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT5 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|)) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) ((_ extract 1 1) N25__AT5))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|)) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) ((_ extract 0 0) N25__AT5))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT5 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))))))
(assert (= sb.mpt.ff_cnt.en__AT5 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT5) ((_ extract 0 0) N25__AT5)) rst__AT5) sb.ff_en.Q__AT5))))
(assert (= sb.mpt.ff_cnt.D__AT5 ((_ zero_extend 0) (ite (= rst__AT5 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) #b0000)) ((_ extract 0 0) N25__AT5))))))))
(assert (= sb.ff_magic_packet.en__AT5 ((_ zero_extend 0) (bvand (bvand start__AT5 ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))))
(assert (= sb.ff_en.en__AT5 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT5))))
(assert (= sb.ff_en.D__AT5 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT5 (bvand start__AT5 ((_ extract 0 0) push__AT5))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT5 #b00)) (bvnot (bvnot (bvcomp N25__AT5 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT5 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT5 reqs__AT5)) ((_ extract 1 1) (bvand N25__AT5 reqs__AT5))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT5 #b00))) (bvand (bvnot (bvcomp N25__AT5 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT5) (bvsub ((_ zero_extend 30) N25__AT5) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT5 ((_ zero_extend 0) N25__AT5)))
(assert (= data_out_vld__AT5 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT5 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT5 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) #b0000)) ((_ extract 0 0) N25__AT5))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT5| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|)) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) ((_ extract 0 0) N25__AT5))))))))))))
(assert (= af.gnt__AT5 ((_ zero_extend 0) N25__AT5)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT5| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT5| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|)))
(assert (= full__AT5 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|)))))))
(assert (= |af.gen_fifos[1].f.full__AT5| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT5| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT5| (concat #b000 ((_ extract 1 1) push__AT5))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT5| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT5| (concat #b000 ((_ extract 1 1) N25__AT5))))))
(assert (= empty__AT5 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT5| |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT5| |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|))))
(assert (= |af.gen_fifos[1].f.empty__AT5| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT5| |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT5| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT5) ((_ extract 1 1) N25__AT5)) rst__AT5))))
(assert (= data_out__AT5 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|)) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) (concat ((_ extract 1 1) N25__AT5) ((_ extract 1 1) N25__AT5))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|)) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) (concat ((_ extract 0 0) N25__AT5) ((_ extract 0 0) N25__AT5))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT5| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT5| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|)))
(assert (= |af.gen_fifos[0].f.full__AT5| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT5| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| (concat #b000 ((_ extract 0 0) push__AT5))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT5| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT5| (concat #b000 ((_ extract 0 0) N25__AT5))))))
(assert (= |af.gen_fifos[0].f.empty__AT5| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT5| |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT5| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT5) ((_ extract 0 0) N25__AT5)) rst__AT5))))
(assert (= |af.fifo_data_out[1]__AT5| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|)))))
(assert (= |af.fifo_data_out[0]__AT5| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|)))))
(assert (= rst__AT5 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT5 (ite (= rst__AT4 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT4) ((_ extract 0 0) N25__AT4)) rst__AT4) sb.ff_en.Q__AT4) #b1) (ite (= rst__AT4 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT4 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT4 #b1000)) ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)))) #b0000)) ((_ extract 0 0) N25__AT4))))) sb.mpt.ff_cnt.Q__AT4))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT5| (ite (= rst__AT4 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT4) ((_ extract 0 0) N25__AT4)) rst__AT4) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT4| (concat #b000 ((_ extract 0 0) N25__AT4))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT4|))))
(assert (= sb.ff_en.Q__AT5 (ite (= rst__AT4 #b1) #b0 (ite (= sb.ff_en.Q__AT4 #b1) #b1 (bvor sb.ff_en.Q__AT4 (bvand start__AT4 ((_ extract 0 0) push__AT4)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| (ite (= rst__AT4 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT4) ((_ extract 0 0) N25__AT4)) rst__AT4) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| (concat #b000 ((_ extract 0 0) push__AT4))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT5| (ite (= rst__AT4 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT4) ((_ extract 1 1) N25__AT4)) rst__AT4) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT4| (concat #b000 ((_ extract 1 1) N25__AT4))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT4|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT5| (ite (= rst__AT4 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT4) ((_ extract 1 1) N25__AT4)) rst__AT4) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT4| (concat #b000 ((_ extract 1 1) push__AT4))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|))))
(assert (= |af.gen_fifos[1].f.entries__AT5| (store |af.gen_fifos[1].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|) (bvor (bvand (concat ((_ extract 1 1) push__AT4) (concat ((_ extract 1 1) push__AT4) (concat ((_ extract 1 1) push__AT4) (concat ((_ extract 1 1) push__AT4) (concat ((_ extract 1 1) push__AT4) (concat ((_ extract 1 1) push__AT4) (concat ((_ extract 1 1) push__AT4) ((_ extract 1 1) push__AT4)))))))) ((_ extract 15 8) flat_data_in__AT4)) (bvand (concat (bvnot ((_ extract 1 1) push__AT4)) (concat (bvnot ((_ extract 1 1) push__AT4)) (concat (bvnot ((_ extract 1 1) push__AT4)) (concat (bvnot ((_ extract 1 1) push__AT4)) (concat (bvnot ((_ extract 1 1) push__AT4)) (concat (bvnot ((_ extract 1 1) push__AT4)) (concat (bvnot ((_ extract 1 1) push__AT4)) (bvnot ((_ extract 1 1) push__AT4))))))))) (select |af.gen_fifos[1].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT4|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT5| (store |af.gen_fifos[0].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|) (bvor (bvand (concat ((_ extract 0 0) push__AT4) (concat ((_ extract 0 0) push__AT4) (concat ((_ extract 0 0) push__AT4) (concat ((_ extract 0 0) push__AT4) (concat ((_ extract 0 0) push__AT4) (concat ((_ extract 0 0) push__AT4) (concat ((_ extract 0 0) push__AT4) ((_ extract 0 0) push__AT4)))))))) ((_ extract 7 0) flat_data_in__AT4)) (bvand (concat (bvnot ((_ extract 0 0) push__AT4)) (concat (bvnot ((_ extract 0 0) push__AT4)) (concat (bvnot ((_ extract 0 0) push__AT4)) (concat (bvnot ((_ extract 0 0) push__AT4)) (concat (bvnot ((_ extract 0 0) push__AT4)) (concat (bvnot ((_ extract 0 0) push__AT4)) (concat (bvnot ((_ extract 0 0) push__AT4)) (bvnot ((_ extract 0 0) push__AT4))))))))) (select |af.gen_fifos[0].f.entries__AT4| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT4|)))))))
(assert (= sb.ff_magic_packet.Q__AT5 (ite (= rst__AT4 #b1) #b00000000 (ite (= (bvand (bvand start__AT4 ((_ extract 0 0) push__AT4)) (bvnot sb.ff_en.Q__AT4)) #b1) ((_ extract 7 0) flat_data_in__AT4) sb.ff_magic_packet.Q__AT4))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT5 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop5 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT5 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|))))

(define-fun en2_prop5 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT5 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|))))

(define-fun en3_prop5 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT5 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|))))

(define-fun en4_prop5 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT5 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|))))

(define-fun en5_prop5 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT5 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|))))

(check-sat-assuming ((not (and en1_prop5 en2_prop5 en3_prop5 en4_prop5 en5_prop5))))



(echo "Checking property at bound 5")

(check-sat)

(pop 1)
(declare-fun flat_data_in__AT5 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT6| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT6 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT6| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT6 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT6| () (_ BitVec 8))
(declare-fun start__AT6 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT6| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT6 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT6 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT6 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT6| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT6 () (_ BitVec 8))
(declare-fun push__AT6 () (_ BitVec 2))
(declare-fun pop__AT6 () (_ BitVec 2))
(declare-fun full__AT6 () (_ BitVec 2))
(declare-fun data_out_vld__AT6 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT6| () (_ BitVec 8))
(declare-fun af.gnt__AT6 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT6| () (_ BitVec 4))
(declare-fun reqs__AT6 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT6| () (_ BitVec 4))
(declare-fun empty__AT6 () (_ BitVec 2))
(declare-fun N25__AT6 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT6| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT6| () (_ BitVec 4))
(declare-fun rst__AT6 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT6| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT6 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT6| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT6| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT6| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT6 () (_ BitVec 1))
(declare-fun data_out__AT6 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT6| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT6| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT6| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT6| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT6| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT6| () (_ BitVec 4))
(declare-fun prop_signal__AT6 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT6| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT6 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT6| () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT6)) (bvnot ((_ extract 1 1) push__AT6))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT6)) (bvnot ((_ extract 0 0) push__AT6))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT6)) (bvnot ((_ extract 0 0) reqs__AT6))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT6)) (bvnot ((_ extract 1 1) reqs__AT6))) #b1))
(assert true)
(assert (= prop_signal__AT6 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT6 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT6 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) #b0000)) ((_ extract 0 0) N25__AT6))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT6 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|)) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) ((_ extract 1 1) N25__AT6))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|)) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) ((_ extract 0 0) N25__AT6))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT6 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))))))
(assert (= sb.mpt.ff_cnt.en__AT6 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT6) ((_ extract 0 0) N25__AT6)) rst__AT6) sb.ff_en.Q__AT6))))
(assert (= sb.mpt.ff_cnt.D__AT6 ((_ zero_extend 0) (ite (= rst__AT6 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) #b0000)) ((_ extract 0 0) N25__AT6))))))))
(assert (= sb.ff_magic_packet.en__AT6 ((_ zero_extend 0) (bvand (bvand start__AT6 ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))))
(assert (= sb.ff_en.en__AT6 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT6))))
(assert (= sb.ff_en.D__AT6 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT6 (bvand start__AT6 ((_ extract 0 0) push__AT6))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT6 #b00)) (bvnot (bvnot (bvcomp N25__AT6 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT6 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT6 reqs__AT6)) ((_ extract 1 1) (bvand N25__AT6 reqs__AT6))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT6 #b00))) (bvand (bvnot (bvcomp N25__AT6 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT6) (bvsub ((_ zero_extend 30) N25__AT6) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT6 ((_ zero_extend 0) N25__AT6)))
(assert (= data_out_vld__AT6 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT6 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT6 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) #b0000)) ((_ extract 0 0) N25__AT6))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT6| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|)) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) ((_ extract 0 0) N25__AT6))))))))))))
(assert (= af.gnt__AT6 ((_ zero_extend 0) N25__AT6)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT6| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT6| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|)))
(assert (= full__AT6 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|)))))))
(assert (= |af.gen_fifos[1].f.full__AT6| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT6| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT6| (concat #b000 ((_ extract 1 1) push__AT6))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT6| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT6| (concat #b000 ((_ extract 1 1) N25__AT6))))))
(assert (= empty__AT6 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT6| |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT6| |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|))))
(assert (= |af.gen_fifos[1].f.empty__AT6| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT6| |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT6| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT6) ((_ extract 1 1) N25__AT6)) rst__AT6))))
(assert (= data_out__AT6 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|)) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) (concat ((_ extract 1 1) N25__AT6) ((_ extract 1 1) N25__AT6))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|)) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) (concat ((_ extract 0 0) N25__AT6) ((_ extract 0 0) N25__AT6))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT6| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT6| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|)))
(assert (= |af.gen_fifos[0].f.full__AT6| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT6| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| (concat #b000 ((_ extract 0 0) push__AT6))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT6| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT6| (concat #b000 ((_ extract 0 0) N25__AT6))))))
(assert (= |af.gen_fifos[0].f.empty__AT6| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT6| |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT6| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT6) ((_ extract 0 0) N25__AT6)) rst__AT6))))
(assert (= |af.fifo_data_out[1]__AT6| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|)))))
(assert (= |af.fifo_data_out[0]__AT6| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|)))))
(assert (= rst__AT6 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT6 (ite (= rst__AT5 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT5) ((_ extract 0 0) N25__AT5)) rst__AT5) sb.ff_en.Q__AT5) #b1) (ite (= rst__AT5 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT5 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT5 #b1000)) ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)))) #b0000)) ((_ extract 0 0) N25__AT5))))) sb.mpt.ff_cnt.Q__AT5))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT6| (ite (= rst__AT5 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT5) ((_ extract 0 0) N25__AT5)) rst__AT5) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT5| (concat #b000 ((_ extract 0 0) N25__AT5))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT5|))))
(assert (= sb.ff_en.Q__AT6 (ite (= rst__AT5 #b1) #b0 (ite (= sb.ff_en.Q__AT5 #b1) #b1 (bvor sb.ff_en.Q__AT5 (bvand start__AT5 ((_ extract 0 0) push__AT5)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| (ite (= rst__AT5 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT5) ((_ extract 0 0) N25__AT5)) rst__AT5) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| (concat #b000 ((_ extract 0 0) push__AT5))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT6| (ite (= rst__AT5 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT5) ((_ extract 1 1) N25__AT5)) rst__AT5) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT5| (concat #b000 ((_ extract 1 1) N25__AT5))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT5|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT6| (ite (= rst__AT5 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT5) ((_ extract 1 1) N25__AT5)) rst__AT5) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT5| (concat #b000 ((_ extract 1 1) push__AT5))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|))))
(assert (= |af.gen_fifos[1].f.entries__AT6| (store |af.gen_fifos[1].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|) (bvor (bvand (concat ((_ extract 1 1) push__AT5) (concat ((_ extract 1 1) push__AT5) (concat ((_ extract 1 1) push__AT5) (concat ((_ extract 1 1) push__AT5) (concat ((_ extract 1 1) push__AT5) (concat ((_ extract 1 1) push__AT5) (concat ((_ extract 1 1) push__AT5) ((_ extract 1 1) push__AT5)))))))) ((_ extract 15 8) flat_data_in__AT5)) (bvand (concat (bvnot ((_ extract 1 1) push__AT5)) (concat (bvnot ((_ extract 1 1) push__AT5)) (concat (bvnot ((_ extract 1 1) push__AT5)) (concat (bvnot ((_ extract 1 1) push__AT5)) (concat (bvnot ((_ extract 1 1) push__AT5)) (concat (bvnot ((_ extract 1 1) push__AT5)) (concat (bvnot ((_ extract 1 1) push__AT5)) (bvnot ((_ extract 1 1) push__AT5))))))))) (select |af.gen_fifos[1].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT5|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT6| (store |af.gen_fifos[0].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|) (bvor (bvand (concat ((_ extract 0 0) push__AT5) (concat ((_ extract 0 0) push__AT5) (concat ((_ extract 0 0) push__AT5) (concat ((_ extract 0 0) push__AT5) (concat ((_ extract 0 0) push__AT5) (concat ((_ extract 0 0) push__AT5) (concat ((_ extract 0 0) push__AT5) ((_ extract 0 0) push__AT5)))))))) ((_ extract 7 0) flat_data_in__AT5)) (bvand (concat (bvnot ((_ extract 0 0) push__AT5)) (concat (bvnot ((_ extract 0 0) push__AT5)) (concat (bvnot ((_ extract 0 0) push__AT5)) (concat (bvnot ((_ extract 0 0) push__AT5)) (concat (bvnot ((_ extract 0 0) push__AT5)) (concat (bvnot ((_ extract 0 0) push__AT5)) (concat (bvnot ((_ extract 0 0) push__AT5)) (bvnot ((_ extract 0 0) push__AT5))))))))) (select |af.gen_fifos[0].f.entries__AT5| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT5|)))))))
(assert (= sb.ff_magic_packet.Q__AT6 (ite (= rst__AT5 #b1) #b00000000 (ite (= (bvand (bvand start__AT5 ((_ extract 0 0) push__AT5)) (bvnot sb.ff_en.Q__AT5)) #b1) ((_ extract 7 0) flat_data_in__AT5) sb.ff_magic_packet.Q__AT5))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT6 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop6 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT6 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|))))

(define-fun en2_prop6 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT6 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|))))

(define-fun en3_prop6 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT6 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|))))

(define-fun en4_prop6 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT6 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|))))

(define-fun en5_prop6 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT6 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|))))

(define-fun en6_prop6 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT6 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|))))

(check-sat-assuming ((not (and en1_prop6 en2_prop6 en3_prop6 en4_prop6 en5_prop6 en6_prop6))))



(echo "Checking property at bound 6")

(check-sat)

(pop 1)
(declare-fun N25__AT7 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT7| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT7| () (_ BitVec 4))
(declare-fun rst__AT7 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT7| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT7 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT7| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT7| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT7| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT7 () (_ BitVec 1))
(declare-fun data_out__AT7 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT7| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT7| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT7| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT7| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT7| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT7| () (_ BitVec 4))
(declare-fun prop_signal__AT7 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT7| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT7 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT7| () (_ BitVec 1))
(declare-fun flat_data_in__AT6 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT7| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT7 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT7| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT7 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT7| () (_ BitVec 8))
(declare-fun start__AT7 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT7| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT7 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT7 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT7 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT7| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT7 () (_ BitVec 8))
(declare-fun push__AT7 () (_ BitVec 2))
(declare-fun pop__AT7 () (_ BitVec 2))
(declare-fun full__AT7 () (_ BitVec 2))
(declare-fun data_out_vld__AT7 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT7| () (_ BitVec 8))
(declare-fun af.gnt__AT7 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT7| () (_ BitVec 4))
(declare-fun reqs__AT7 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT7| () (_ BitVec 4))
(declare-fun empty__AT7 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT7)) (bvnot ((_ extract 1 1) push__AT7))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT7)) (bvnot ((_ extract 0 0) push__AT7))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT7)) (bvnot ((_ extract 0 0) reqs__AT7))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT7)) (bvnot ((_ extract 1 1) reqs__AT7))) #b1))
(assert true)
(assert (= prop_signal__AT7 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT7 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT7 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) #b0000)) ((_ extract 0 0) N25__AT7))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT7 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|)) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) ((_ extract 1 1) N25__AT7))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|)) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) ((_ extract 0 0) N25__AT7))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT7 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))))))
(assert (= sb.mpt.ff_cnt.en__AT7 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT7) ((_ extract 0 0) N25__AT7)) rst__AT7) sb.ff_en.Q__AT7))))
(assert (= sb.mpt.ff_cnt.D__AT7 ((_ zero_extend 0) (ite (= rst__AT7 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) #b0000)) ((_ extract 0 0) N25__AT7))))))))
(assert (= sb.ff_magic_packet.en__AT7 ((_ zero_extend 0) (bvand (bvand start__AT7 ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))))
(assert (= sb.ff_en.en__AT7 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT7))))
(assert (= sb.ff_en.D__AT7 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT7 (bvand start__AT7 ((_ extract 0 0) push__AT7))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT7 #b00)) (bvnot (bvnot (bvcomp N25__AT7 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT7 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT7 reqs__AT7)) ((_ extract 1 1) (bvand N25__AT7 reqs__AT7))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT7 #b00))) (bvand (bvnot (bvcomp N25__AT7 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT7) (bvsub ((_ zero_extend 30) N25__AT7) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT7 ((_ zero_extend 0) N25__AT7)))
(assert (= data_out_vld__AT7 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT7 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT7 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) #b0000)) ((_ extract 0 0) N25__AT7))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT7| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|)) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) ((_ extract 0 0) N25__AT7))))))))))))
(assert (= af.gnt__AT7 ((_ zero_extend 0) N25__AT7)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT7| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT7| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|)))
(assert (= full__AT7 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|)))))))
(assert (= |af.gen_fifos[1].f.full__AT7| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT7| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT7| (concat #b000 ((_ extract 1 1) push__AT7))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT7| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT7| (concat #b000 ((_ extract 1 1) N25__AT7))))))
(assert (= empty__AT7 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT7| |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT7| |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|))))
(assert (= |af.gen_fifos[1].f.empty__AT7| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT7| |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT7| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT7) ((_ extract 1 1) N25__AT7)) rst__AT7))))
(assert (= data_out__AT7 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|)) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) (concat ((_ extract 1 1) N25__AT7) ((_ extract 1 1) N25__AT7))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|)) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) (concat ((_ extract 0 0) N25__AT7) ((_ extract 0 0) N25__AT7))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT7| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT7| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|)))
(assert (= |af.gen_fifos[0].f.full__AT7| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT7| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| (concat #b000 ((_ extract 0 0) push__AT7))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT7| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT7| (concat #b000 ((_ extract 0 0) N25__AT7))))))
(assert (= |af.gen_fifos[0].f.empty__AT7| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT7| |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT7| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT7) ((_ extract 0 0) N25__AT7)) rst__AT7))))
(assert (= |af.fifo_data_out[1]__AT7| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|)))))
(assert (= |af.fifo_data_out[0]__AT7| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|)))))
(assert (= rst__AT7 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT7 (ite (= rst__AT6 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT6) ((_ extract 0 0) N25__AT6)) rst__AT6) sb.ff_en.Q__AT6) #b1) (ite (= rst__AT6 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT6 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT6 #b1000)) ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)))) #b0000)) ((_ extract 0 0) N25__AT6))))) sb.mpt.ff_cnt.Q__AT6))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT7| (ite (= rst__AT6 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT6) ((_ extract 0 0) N25__AT6)) rst__AT6) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT6| (concat #b000 ((_ extract 0 0) N25__AT6))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT6|))))
(assert (= sb.ff_en.Q__AT7 (ite (= rst__AT6 #b1) #b0 (ite (= sb.ff_en.Q__AT6 #b1) #b1 (bvor sb.ff_en.Q__AT6 (bvand start__AT6 ((_ extract 0 0) push__AT6)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| (ite (= rst__AT6 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT6) ((_ extract 0 0) N25__AT6)) rst__AT6) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| (concat #b000 ((_ extract 0 0) push__AT6))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT7| (ite (= rst__AT6 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT6) ((_ extract 1 1) N25__AT6)) rst__AT6) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT6| (concat #b000 ((_ extract 1 1) N25__AT6))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT6|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT7| (ite (= rst__AT6 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT6) ((_ extract 1 1) N25__AT6)) rst__AT6) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT6| (concat #b000 ((_ extract 1 1) push__AT6))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|))))
(assert (= |af.gen_fifos[1].f.entries__AT7| (store |af.gen_fifos[1].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|) (bvor (bvand (concat ((_ extract 1 1) push__AT6) (concat ((_ extract 1 1) push__AT6) (concat ((_ extract 1 1) push__AT6) (concat ((_ extract 1 1) push__AT6) (concat ((_ extract 1 1) push__AT6) (concat ((_ extract 1 1) push__AT6) (concat ((_ extract 1 1) push__AT6) ((_ extract 1 1) push__AT6)))))))) ((_ extract 15 8) flat_data_in__AT6)) (bvand (concat (bvnot ((_ extract 1 1) push__AT6)) (concat (bvnot ((_ extract 1 1) push__AT6)) (concat (bvnot ((_ extract 1 1) push__AT6)) (concat (bvnot ((_ extract 1 1) push__AT6)) (concat (bvnot ((_ extract 1 1) push__AT6)) (concat (bvnot ((_ extract 1 1) push__AT6)) (concat (bvnot ((_ extract 1 1) push__AT6)) (bvnot ((_ extract 1 1) push__AT6))))))))) (select |af.gen_fifos[1].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT6|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT7| (store |af.gen_fifos[0].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|) (bvor (bvand (concat ((_ extract 0 0) push__AT6) (concat ((_ extract 0 0) push__AT6) (concat ((_ extract 0 0) push__AT6) (concat ((_ extract 0 0) push__AT6) (concat ((_ extract 0 0) push__AT6) (concat ((_ extract 0 0) push__AT6) (concat ((_ extract 0 0) push__AT6) ((_ extract 0 0) push__AT6)))))))) ((_ extract 7 0) flat_data_in__AT6)) (bvand (concat (bvnot ((_ extract 0 0) push__AT6)) (concat (bvnot ((_ extract 0 0) push__AT6)) (concat (bvnot ((_ extract 0 0) push__AT6)) (concat (bvnot ((_ extract 0 0) push__AT6)) (concat (bvnot ((_ extract 0 0) push__AT6)) (concat (bvnot ((_ extract 0 0) push__AT6)) (concat (bvnot ((_ extract 0 0) push__AT6)) (bvnot ((_ extract 0 0) push__AT6))))))))) (select |af.gen_fifos[0].f.entries__AT6| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT6|)))))))
(assert (= sb.ff_magic_packet.Q__AT7 (ite (= rst__AT6 #b1) #b00000000 (ite (= (bvand (bvand start__AT6 ((_ extract 0 0) push__AT6)) (bvnot sb.ff_en.Q__AT6)) #b1) ((_ extract 7 0) flat_data_in__AT6) sb.ff_magic_packet.Q__AT6))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT7 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop7 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT7 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))

(define-fun en2_prop7 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT7 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))

(define-fun en3_prop7 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT7 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))

(define-fun en4_prop7 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT7 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))

(define-fun en5_prop7 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT7 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))

(define-fun en6_prop7 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT7 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))

(define-fun en7_prop7 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT7 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))

(check-sat-assuming ((not (and en1_prop7 en2_prop7 en3_prop7 en4_prop7 en5_prop7 en6_prop7 en7_prop7))))



(echo "Checking property at bound 7")

(check-sat)

(pop 1)
(declare-fun sb.ff_en.D__AT8 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT8| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT8 () (_ BitVec 8))
(declare-fun push__AT8 () (_ BitVec 2))
(declare-fun pop__AT8 () (_ BitVec 2))
(declare-fun full__AT8 () (_ BitVec 2))
(declare-fun data_out_vld__AT8 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT8| () (_ BitVec 8))
(declare-fun af.gnt__AT8 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT8| () (_ BitVec 4))
(declare-fun reqs__AT8 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT8| () (_ BitVec 4))
(declare-fun empty__AT8 () (_ BitVec 2))
(declare-fun N25__AT8 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT8| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT8| () (_ BitVec 4))
(declare-fun rst__AT8 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT8| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT8| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT8 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT8| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT8| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT8| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT8 () (_ BitVec 1))
(declare-fun data_out__AT8 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT8| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT8| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT8| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT8| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT8| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT8| () (_ BitVec 4))
(declare-fun prop_signal__AT8 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT8| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT8 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT8| () (_ BitVec 1))
(declare-fun flat_data_in__AT7 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT8| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT8 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT8| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT8 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT8| () (_ BitVec 8))
(declare-fun start__AT8 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT8 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT8 () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT8)) (bvnot ((_ extract 1 1) push__AT8))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT8)) (bvnot ((_ extract 0 0) push__AT8))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT8)) (bvnot ((_ extract 0 0) reqs__AT8))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT8)) (bvnot ((_ extract 1 1) reqs__AT8))) #b1))
(assert true)
(assert (= prop_signal__AT8 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT8 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT8 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) #b0000)) ((_ extract 0 0) N25__AT8))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT8 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|)) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) ((_ extract 1 1) N25__AT8))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|)) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) ((_ extract 0 0) N25__AT8))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT8 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))))))
(assert (= sb.mpt.ff_cnt.en__AT8 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT8) ((_ extract 0 0) N25__AT8)) rst__AT8) sb.ff_en.Q__AT8))))
(assert (= sb.mpt.ff_cnt.D__AT8 ((_ zero_extend 0) (ite (= rst__AT8 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) #b0000)) ((_ extract 0 0) N25__AT8))))))))
(assert (= sb.ff_magic_packet.en__AT8 ((_ zero_extend 0) (bvand (bvand start__AT8 ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))))
(assert (= sb.ff_en.en__AT8 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT8))))
(assert (= sb.ff_en.D__AT8 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT8 (bvand start__AT8 ((_ extract 0 0) push__AT8))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT8 #b00)) (bvnot (bvnot (bvcomp N25__AT8 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT8 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT8 reqs__AT8)) ((_ extract 1 1) (bvand N25__AT8 reqs__AT8))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT8 #b00))) (bvand (bvnot (bvcomp N25__AT8 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT8) (bvsub ((_ zero_extend 30) N25__AT8) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT8 ((_ zero_extend 0) N25__AT8)))
(assert (= data_out_vld__AT8 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT8 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT8 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) #b0000)) ((_ extract 0 0) N25__AT8))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT8| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|)) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) ((_ extract 0 0) N25__AT8))))))))))))
(assert (= af.gnt__AT8 ((_ zero_extend 0) N25__AT8)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT8| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT8| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|)))
(assert (= full__AT8 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|)))))))
(assert (= |af.gen_fifos[1].f.full__AT8| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT8| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT8| (concat #b000 ((_ extract 1 1) push__AT8))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT8| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT8| (concat #b000 ((_ extract 1 1) N25__AT8))))))
(assert (= empty__AT8 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT8| |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT8| |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|))))
(assert (= |af.gen_fifos[1].f.empty__AT8| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT8| |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT8| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT8) ((_ extract 1 1) N25__AT8)) rst__AT8))))
(assert (= data_out__AT8 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|)) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) (concat ((_ extract 1 1) N25__AT8) ((_ extract 1 1) N25__AT8))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|)) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) (concat ((_ extract 0 0) N25__AT8) ((_ extract 0 0) N25__AT8))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT8| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT8| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|)))
(assert (= |af.gen_fifos[0].f.full__AT8| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT8| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| (concat #b000 ((_ extract 0 0) push__AT8))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT8| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT8| (concat #b000 ((_ extract 0 0) N25__AT8))))))
(assert (= |af.gen_fifos[0].f.empty__AT8| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT8| |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT8| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT8) ((_ extract 0 0) N25__AT8)) rst__AT8))))
(assert (= |af.fifo_data_out[1]__AT8| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|)))))
(assert (= |af.fifo_data_out[0]__AT8| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|)))))
(assert (= rst__AT8 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT8 (ite (= rst__AT7 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT7) ((_ extract 0 0) N25__AT7)) rst__AT7) sb.ff_en.Q__AT7) #b1) (ite (= rst__AT7 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT7 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT7 #b1000)) ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)))) #b0000)) ((_ extract 0 0) N25__AT7))))) sb.mpt.ff_cnt.Q__AT7))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT8| (ite (= rst__AT7 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT7) ((_ extract 0 0) N25__AT7)) rst__AT7) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT7| (concat #b000 ((_ extract 0 0) N25__AT7))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT7|))))
(assert (= sb.ff_en.Q__AT8 (ite (= rst__AT7 #b1) #b0 (ite (= sb.ff_en.Q__AT7 #b1) #b1 (bvor sb.ff_en.Q__AT7 (bvand start__AT7 ((_ extract 0 0) push__AT7)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| (ite (= rst__AT7 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT7) ((_ extract 0 0) N25__AT7)) rst__AT7) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| (concat #b000 ((_ extract 0 0) push__AT7))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT8| (ite (= rst__AT7 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT7) ((_ extract 1 1) N25__AT7)) rst__AT7) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT7| (concat #b000 ((_ extract 1 1) N25__AT7))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT7|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT8| (ite (= rst__AT7 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT7) ((_ extract 1 1) N25__AT7)) rst__AT7) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT7| (concat #b000 ((_ extract 1 1) push__AT7))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|))))
(assert (= |af.gen_fifos[1].f.entries__AT8| (store |af.gen_fifos[1].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|) (bvor (bvand (concat ((_ extract 1 1) push__AT7) (concat ((_ extract 1 1) push__AT7) (concat ((_ extract 1 1) push__AT7) (concat ((_ extract 1 1) push__AT7) (concat ((_ extract 1 1) push__AT7) (concat ((_ extract 1 1) push__AT7) (concat ((_ extract 1 1) push__AT7) ((_ extract 1 1) push__AT7)))))))) ((_ extract 15 8) flat_data_in__AT7)) (bvand (concat (bvnot ((_ extract 1 1) push__AT7)) (concat (bvnot ((_ extract 1 1) push__AT7)) (concat (bvnot ((_ extract 1 1) push__AT7)) (concat (bvnot ((_ extract 1 1) push__AT7)) (concat (bvnot ((_ extract 1 1) push__AT7)) (concat (bvnot ((_ extract 1 1) push__AT7)) (concat (bvnot ((_ extract 1 1) push__AT7)) (bvnot ((_ extract 1 1) push__AT7))))))))) (select |af.gen_fifos[1].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT7|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT8| (store |af.gen_fifos[0].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|) (bvor (bvand (concat ((_ extract 0 0) push__AT7) (concat ((_ extract 0 0) push__AT7) (concat ((_ extract 0 0) push__AT7) (concat ((_ extract 0 0) push__AT7) (concat ((_ extract 0 0) push__AT7) (concat ((_ extract 0 0) push__AT7) (concat ((_ extract 0 0) push__AT7) ((_ extract 0 0) push__AT7)))))))) ((_ extract 7 0) flat_data_in__AT7)) (bvand (concat (bvnot ((_ extract 0 0) push__AT7)) (concat (bvnot ((_ extract 0 0) push__AT7)) (concat (bvnot ((_ extract 0 0) push__AT7)) (concat (bvnot ((_ extract 0 0) push__AT7)) (concat (bvnot ((_ extract 0 0) push__AT7)) (concat (bvnot ((_ extract 0 0) push__AT7)) (concat (bvnot ((_ extract 0 0) push__AT7)) (bvnot ((_ extract 0 0) push__AT7))))))))) (select |af.gen_fifos[0].f.entries__AT7| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT7|)))))))
(assert (= sb.ff_magic_packet.Q__AT8 (ite (= rst__AT7 #b1) #b00000000 (ite (= (bvand (bvand start__AT7 ((_ extract 0 0) push__AT7)) (bvnot sb.ff_en.Q__AT7)) #b1) ((_ extract 7 0) flat_data_in__AT7) sb.ff_magic_packet.Q__AT7))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT8 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop8 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(define-fun en2_prop8 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(define-fun en3_prop8 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(define-fun en4_prop8 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(define-fun en5_prop8 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(define-fun en6_prop8 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(define-fun en7_prop8 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(define-fun en8_prop8 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT8 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))

(check-sat-assuming ((not (and en1_prop8 en2_prop8 en3_prop8 en4_prop8 en5_prop8 en6_prop8 en7_prop8 en8_prop8))))



(echo "Checking property at bound 8")

(check-sat)

(pop 1)
(declare-fun rst__AT9 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT9| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT9 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT9| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT9| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT9| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT9 () (_ BitVec 1))
(declare-fun data_out__AT9 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT9| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT9| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT9| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT9| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT9| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT9| () (_ BitVec 4))
(declare-fun prop_signal__AT9 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT9| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT9 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT9| () (_ BitVec 1))
(declare-fun flat_data_in__AT8 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT9| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT9 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT9| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT9 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT9| () (_ BitVec 8))
(declare-fun start__AT9 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT9| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT9 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT9 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT9 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT9| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT9 () (_ BitVec 8))
(declare-fun push__AT9 () (_ BitVec 2))
(declare-fun pop__AT9 () (_ BitVec 2))
(declare-fun full__AT9 () (_ BitVec 2))
(declare-fun data_out_vld__AT9 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT9| () (_ BitVec 8))
(declare-fun af.gnt__AT9 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT9| () (_ BitVec 4))
(declare-fun reqs__AT9 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT9| () (_ BitVec 4))
(declare-fun empty__AT9 () (_ BitVec 2))
(declare-fun N25__AT9 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT9| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT9| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT9)) (bvnot ((_ extract 1 1) push__AT9))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT9)) (bvnot ((_ extract 0 0) push__AT9))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT9)) (bvnot ((_ extract 0 0) reqs__AT9))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT9)) (bvnot ((_ extract 1 1) reqs__AT9))) #b1))
(assert true)
(assert (= prop_signal__AT9 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT9 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT9 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) #b0000)) ((_ extract 0 0) N25__AT9))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT9 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|)) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) ((_ extract 1 1) N25__AT9))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|)) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) ((_ extract 0 0) N25__AT9))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT9 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))))))
(assert (= sb.mpt.ff_cnt.en__AT9 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT9) ((_ extract 0 0) N25__AT9)) rst__AT9) sb.ff_en.Q__AT9))))
(assert (= sb.mpt.ff_cnt.D__AT9 ((_ zero_extend 0) (ite (= rst__AT9 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) #b0000)) ((_ extract 0 0) N25__AT9))))))))
(assert (= sb.ff_magic_packet.en__AT9 ((_ zero_extend 0) (bvand (bvand start__AT9 ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))))
(assert (= sb.ff_en.en__AT9 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT9))))
(assert (= sb.ff_en.D__AT9 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT9 (bvand start__AT9 ((_ extract 0 0) push__AT9))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT9 #b00)) (bvnot (bvnot (bvcomp N25__AT9 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT9 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT9 reqs__AT9)) ((_ extract 1 1) (bvand N25__AT9 reqs__AT9))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT9 #b00))) (bvand (bvnot (bvcomp N25__AT9 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT9) (bvsub ((_ zero_extend 30) N25__AT9) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT9 ((_ zero_extend 0) N25__AT9)))
(assert (= data_out_vld__AT9 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT9 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT9 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) #b0000)) ((_ extract 0 0) N25__AT9))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT9| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|)) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) ((_ extract 0 0) N25__AT9))))))))))))
(assert (= af.gnt__AT9 ((_ zero_extend 0) N25__AT9)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT9| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT9| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|)))
(assert (= full__AT9 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|)))))))
(assert (= |af.gen_fifos[1].f.full__AT9| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT9| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT9| (concat #b000 ((_ extract 1 1) push__AT9))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT9| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT9| (concat #b000 ((_ extract 1 1) N25__AT9))))))
(assert (= empty__AT9 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT9| |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT9| |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|))))
(assert (= |af.gen_fifos[1].f.empty__AT9| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT9| |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT9| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT9) ((_ extract 1 1) N25__AT9)) rst__AT9))))
(assert (= data_out__AT9 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|)) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) (concat ((_ extract 1 1) N25__AT9) ((_ extract 1 1) N25__AT9))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|)) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) (concat ((_ extract 0 0) N25__AT9) ((_ extract 0 0) N25__AT9))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT9| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT9| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|)))
(assert (= |af.gen_fifos[0].f.full__AT9| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT9| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| (concat #b000 ((_ extract 0 0) push__AT9))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT9| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT9| (concat #b000 ((_ extract 0 0) N25__AT9))))))
(assert (= |af.gen_fifos[0].f.empty__AT9| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT9| |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT9| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT9) ((_ extract 0 0) N25__AT9)) rst__AT9))))
(assert (= |af.fifo_data_out[1]__AT9| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|)))))
(assert (= |af.fifo_data_out[0]__AT9| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|)))))
(assert (= rst__AT9 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT9 (ite (= rst__AT8 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT8) ((_ extract 0 0) N25__AT8)) rst__AT8) sb.ff_en.Q__AT8) #b1) (ite (= rst__AT8 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT8 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT8 #b1000)) ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)))) #b0000)) ((_ extract 0 0) N25__AT8))))) sb.mpt.ff_cnt.Q__AT8))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT9| (ite (= rst__AT8 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT8) ((_ extract 0 0) N25__AT8)) rst__AT8) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT8| (concat #b000 ((_ extract 0 0) N25__AT8))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT8|))))
(assert (= sb.ff_en.Q__AT9 (ite (= rst__AT8 #b1) #b0 (ite (= sb.ff_en.Q__AT8 #b1) #b1 (bvor sb.ff_en.Q__AT8 (bvand start__AT8 ((_ extract 0 0) push__AT8)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| (ite (= rst__AT8 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT8) ((_ extract 0 0) N25__AT8)) rst__AT8) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| (concat #b000 ((_ extract 0 0) push__AT8))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT9| (ite (= rst__AT8 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT8) ((_ extract 1 1) N25__AT8)) rst__AT8) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT8| (concat #b000 ((_ extract 1 1) N25__AT8))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT8|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT9| (ite (= rst__AT8 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT8) ((_ extract 1 1) N25__AT8)) rst__AT8) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT8| (concat #b000 ((_ extract 1 1) push__AT8))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|))))
(assert (= |af.gen_fifos[1].f.entries__AT9| (store |af.gen_fifos[1].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|) (bvor (bvand (concat ((_ extract 1 1) push__AT8) (concat ((_ extract 1 1) push__AT8) (concat ((_ extract 1 1) push__AT8) (concat ((_ extract 1 1) push__AT8) (concat ((_ extract 1 1) push__AT8) (concat ((_ extract 1 1) push__AT8) (concat ((_ extract 1 1) push__AT8) ((_ extract 1 1) push__AT8)))))))) ((_ extract 15 8) flat_data_in__AT8)) (bvand (concat (bvnot ((_ extract 1 1) push__AT8)) (concat (bvnot ((_ extract 1 1) push__AT8)) (concat (bvnot ((_ extract 1 1) push__AT8)) (concat (bvnot ((_ extract 1 1) push__AT8)) (concat (bvnot ((_ extract 1 1) push__AT8)) (concat (bvnot ((_ extract 1 1) push__AT8)) (concat (bvnot ((_ extract 1 1) push__AT8)) (bvnot ((_ extract 1 1) push__AT8))))))))) (select |af.gen_fifos[1].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT8|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT9| (store |af.gen_fifos[0].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|) (bvor (bvand (concat ((_ extract 0 0) push__AT8) (concat ((_ extract 0 0) push__AT8) (concat ((_ extract 0 0) push__AT8) (concat ((_ extract 0 0) push__AT8) (concat ((_ extract 0 0) push__AT8) (concat ((_ extract 0 0) push__AT8) (concat ((_ extract 0 0) push__AT8) ((_ extract 0 0) push__AT8)))))))) ((_ extract 7 0) flat_data_in__AT8)) (bvand (concat (bvnot ((_ extract 0 0) push__AT8)) (concat (bvnot ((_ extract 0 0) push__AT8)) (concat (bvnot ((_ extract 0 0) push__AT8)) (concat (bvnot ((_ extract 0 0) push__AT8)) (concat (bvnot ((_ extract 0 0) push__AT8)) (concat (bvnot ((_ extract 0 0) push__AT8)) (concat (bvnot ((_ extract 0 0) push__AT8)) (bvnot ((_ extract 0 0) push__AT8))))))))) (select |af.gen_fifos[0].f.entries__AT8| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT8|)))))))
(assert (= sb.ff_magic_packet.Q__AT9 (ite (= rst__AT8 #b1) #b00000000 (ite (= (bvand (bvand start__AT8 ((_ extract 0 0) push__AT8)) (bvnot sb.ff_en.Q__AT8)) #b1) ((_ extract 7 0) flat_data_in__AT8) sb.ff_magic_packet.Q__AT8))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT9 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop9 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en2_prop9 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en3_prop9 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en4_prop9 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en5_prop9 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en6_prop9 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en7_prop9 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en8_prop9 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(define-fun en9_prop9 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT9 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))

(check-sat-assuming ((not (and en1_prop9 en2_prop9 en3_prop9 en4_prop9 en5_prop9 en6_prop9 en7_prop9 en8_prop9 en9_prop9))))



(echo "Checking property at bound 9")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[0].f.entries__AT10| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT10 () (_ BitVec 8))
(declare-fun push__AT10 () (_ BitVec 2))
(declare-fun pop__AT10 () (_ BitVec 2))
(declare-fun full__AT10 () (_ BitVec 2))
(declare-fun data_out_vld__AT10 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT10| () (_ BitVec 8))
(declare-fun af.gnt__AT10 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT10| () (_ BitVec 4))
(declare-fun reqs__AT10 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT10| () (_ BitVec 4))
(declare-fun empty__AT10 () (_ BitVec 2))
(declare-fun N25__AT10 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT10| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT10| () (_ BitVec 4))
(declare-fun rst__AT10 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT10| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT10 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT10| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT10| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT10| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT10 () (_ BitVec 1))
(declare-fun data_out__AT10 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT10| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT10| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT10| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT10| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT10| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT10| () (_ BitVec 4))
(declare-fun prop_signal__AT10 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT10| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT10 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT10| () (_ BitVec 1))
(declare-fun flat_data_in__AT9 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT10| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT10 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT10| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT10 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT10| () (_ BitVec 8))
(declare-fun start__AT10 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT10| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT10 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT10 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT10 () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT10)) (bvnot ((_ extract 1 1) push__AT10))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT10)) (bvnot ((_ extract 0 0) push__AT10))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT10)) (bvnot ((_ extract 0 0) reqs__AT10))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT10)) (bvnot ((_ extract 1 1) reqs__AT10))) #b1))
(assert true)
(assert (= prop_signal__AT10 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT10 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT10 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) #b0000)) ((_ extract 0 0) N25__AT10))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT10 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|)) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) ((_ extract 1 1) N25__AT10))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|)) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) ((_ extract 0 0) N25__AT10))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT10 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))))))
(assert (= sb.mpt.ff_cnt.en__AT10 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT10) ((_ extract 0 0) N25__AT10)) rst__AT10) sb.ff_en.Q__AT10))))
(assert (= sb.mpt.ff_cnt.D__AT10 ((_ zero_extend 0) (ite (= rst__AT10 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) #b0000)) ((_ extract 0 0) N25__AT10))))))))
(assert (= sb.ff_magic_packet.en__AT10 ((_ zero_extend 0) (bvand (bvand start__AT10 ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))))
(assert (= sb.ff_en.en__AT10 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT10))))
(assert (= sb.ff_en.D__AT10 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT10 (bvand start__AT10 ((_ extract 0 0) push__AT10))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT10 #b00)) (bvnot (bvnot (bvcomp N25__AT10 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT10 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT10 reqs__AT10)) ((_ extract 1 1) (bvand N25__AT10 reqs__AT10))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT10 #b00))) (bvand (bvnot (bvcomp N25__AT10 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT10) (bvsub ((_ zero_extend 30) N25__AT10) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT10 ((_ zero_extend 0) N25__AT10)))
(assert (= data_out_vld__AT10 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT10 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT10 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) #b0000)) ((_ extract 0 0) N25__AT10))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT10| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|)) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) ((_ extract 0 0) N25__AT10))))))))))))
(assert (= af.gnt__AT10 ((_ zero_extend 0) N25__AT10)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT10| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT10| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|)))
(assert (= full__AT10 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|)))))))
(assert (= |af.gen_fifos[1].f.full__AT10| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT10| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT10| (concat #b000 ((_ extract 1 1) push__AT10))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT10| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT10| (concat #b000 ((_ extract 1 1) N25__AT10))))))
(assert (= empty__AT10 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT10| |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT10| |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|))))
(assert (= |af.gen_fifos[1].f.empty__AT10| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT10| |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT10| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT10) ((_ extract 1 1) N25__AT10)) rst__AT10))))
(assert (= data_out__AT10 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|)) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) (concat ((_ extract 1 1) N25__AT10) ((_ extract 1 1) N25__AT10))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|)) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) (concat ((_ extract 0 0) N25__AT10) ((_ extract 0 0) N25__AT10))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT10| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT10| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|)))
(assert (= |af.gen_fifos[0].f.full__AT10| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT10| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| (concat #b000 ((_ extract 0 0) push__AT10))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT10| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT10| (concat #b000 ((_ extract 0 0) N25__AT10))))))
(assert (= |af.gen_fifos[0].f.empty__AT10| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT10| |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT10| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT10) ((_ extract 0 0) N25__AT10)) rst__AT10))))
(assert (= |af.fifo_data_out[1]__AT10| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|)))))
(assert (= |af.fifo_data_out[0]__AT10| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|)))))
(assert (= rst__AT10 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT10 (ite (= rst__AT9 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT9) ((_ extract 0 0) N25__AT9)) rst__AT9) sb.ff_en.Q__AT9) #b1) (ite (= rst__AT9 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT9 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT9 #b1000)) ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)))) #b0000)) ((_ extract 0 0) N25__AT9))))) sb.mpt.ff_cnt.Q__AT9))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT10| (ite (= rst__AT9 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT9) ((_ extract 0 0) N25__AT9)) rst__AT9) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT9| (concat #b000 ((_ extract 0 0) N25__AT9))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT9|))))
(assert (= sb.ff_en.Q__AT10 (ite (= rst__AT9 #b1) #b0 (ite (= sb.ff_en.Q__AT9 #b1) #b1 (bvor sb.ff_en.Q__AT9 (bvand start__AT9 ((_ extract 0 0) push__AT9)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| (ite (= rst__AT9 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT9) ((_ extract 0 0) N25__AT9)) rst__AT9) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| (concat #b000 ((_ extract 0 0) push__AT9))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT10| (ite (= rst__AT9 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT9) ((_ extract 1 1) N25__AT9)) rst__AT9) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT9| (concat #b000 ((_ extract 1 1) N25__AT9))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT9|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT10| (ite (= rst__AT9 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT9) ((_ extract 1 1) N25__AT9)) rst__AT9) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT9| (concat #b000 ((_ extract 1 1) push__AT9))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|))))
(assert (= |af.gen_fifos[1].f.entries__AT10| (store |af.gen_fifos[1].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|) (bvor (bvand (concat ((_ extract 1 1) push__AT9) (concat ((_ extract 1 1) push__AT9) (concat ((_ extract 1 1) push__AT9) (concat ((_ extract 1 1) push__AT9) (concat ((_ extract 1 1) push__AT9) (concat ((_ extract 1 1) push__AT9) (concat ((_ extract 1 1) push__AT9) ((_ extract 1 1) push__AT9)))))))) ((_ extract 15 8) flat_data_in__AT9)) (bvand (concat (bvnot ((_ extract 1 1) push__AT9)) (concat (bvnot ((_ extract 1 1) push__AT9)) (concat (bvnot ((_ extract 1 1) push__AT9)) (concat (bvnot ((_ extract 1 1) push__AT9)) (concat (bvnot ((_ extract 1 1) push__AT9)) (concat (bvnot ((_ extract 1 1) push__AT9)) (concat (bvnot ((_ extract 1 1) push__AT9)) (bvnot ((_ extract 1 1) push__AT9))))))))) (select |af.gen_fifos[1].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT9|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT10| (store |af.gen_fifos[0].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|) (bvor (bvand (concat ((_ extract 0 0) push__AT9) (concat ((_ extract 0 0) push__AT9) (concat ((_ extract 0 0) push__AT9) (concat ((_ extract 0 0) push__AT9) (concat ((_ extract 0 0) push__AT9) (concat ((_ extract 0 0) push__AT9) (concat ((_ extract 0 0) push__AT9) ((_ extract 0 0) push__AT9)))))))) ((_ extract 7 0) flat_data_in__AT9)) (bvand (concat (bvnot ((_ extract 0 0) push__AT9)) (concat (bvnot ((_ extract 0 0) push__AT9)) (concat (bvnot ((_ extract 0 0) push__AT9)) (concat (bvnot ((_ extract 0 0) push__AT9)) (concat (bvnot ((_ extract 0 0) push__AT9)) (concat (bvnot ((_ extract 0 0) push__AT9)) (concat (bvnot ((_ extract 0 0) push__AT9)) (bvnot ((_ extract 0 0) push__AT9))))))))) (select |af.gen_fifos[0].f.entries__AT9| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT9|)))))))
(assert (= sb.ff_magic_packet.Q__AT10 (ite (= rst__AT9 #b1) #b00000000 (ite (= (bvand (bvand start__AT9 ((_ extract 0 0) push__AT9)) (bvnot sb.ff_en.Q__AT9)) #b1) ((_ extract 7 0) flat_data_in__AT9) sb.ff_magic_packet.Q__AT9))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT10 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop10 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en2_prop10 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en3_prop10 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en4_prop10 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en5_prop10 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en6_prop10 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en7_prop10 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en8_prop10 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en9_prop10 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(define-fun en10_prop10 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT10 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))

(check-sat-assuming ((not (and en1_prop10 en2_prop10 en3_prop10 en4_prop10 en5_prop10 en6_prop10 en7_prop10 en8_prop10 en9_prop10 en10_prop10))))



(echo "Checking property at bound 10")

(check-sat)

(pop 1)
(declare-fun sb.ff_en.Q__AT11 () (_ BitVec 1))
(declare-fun data_out__AT11 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT11| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT11| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT11| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT11| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT11| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT11| () (_ BitVec 4))
(declare-fun prop_signal__AT11 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT11| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT11 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT11| () (_ BitVec 1))
(declare-fun flat_data_in__AT10 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT11| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT11 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT11| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT11 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT11| () (_ BitVec 8))
(declare-fun start__AT11 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT11| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT11 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT11 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT11 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT11| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT11 () (_ BitVec 8))
(declare-fun push__AT11 () (_ BitVec 2))
(declare-fun pop__AT11 () (_ BitVec 2))
(declare-fun full__AT11 () (_ BitVec 2))
(declare-fun data_out_vld__AT11 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT11| () (_ BitVec 8))
(declare-fun af.gnt__AT11 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT11| () (_ BitVec 4))
(declare-fun reqs__AT11 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT11| () (_ BitVec 4))
(declare-fun empty__AT11 () (_ BitVec 2))
(declare-fun N25__AT11 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT11| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT11| () (_ BitVec 4))
(declare-fun rst__AT11 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT11| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT11 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT11| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT11| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT11| () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT11)) (bvnot ((_ extract 1 1) push__AT11))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT11)) (bvnot ((_ extract 0 0) push__AT11))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT11)) (bvnot ((_ extract 0 0) reqs__AT11))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT11)) (bvnot ((_ extract 1 1) reqs__AT11))) #b1))
(assert true)
(assert (= prop_signal__AT11 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT11 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT11 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) #b0000)) ((_ extract 0 0) N25__AT11))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT11 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|)) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) ((_ extract 1 1) N25__AT11))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|)) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) ((_ extract 0 0) N25__AT11))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT11 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))))))
(assert (= sb.mpt.ff_cnt.en__AT11 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT11) ((_ extract 0 0) N25__AT11)) rst__AT11) sb.ff_en.Q__AT11))))
(assert (= sb.mpt.ff_cnt.D__AT11 ((_ zero_extend 0) (ite (= rst__AT11 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) #b0000)) ((_ extract 0 0) N25__AT11))))))))
(assert (= sb.ff_magic_packet.en__AT11 ((_ zero_extend 0) (bvand (bvand start__AT11 ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))))
(assert (= sb.ff_en.en__AT11 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT11))))
(assert (= sb.ff_en.D__AT11 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT11 (bvand start__AT11 ((_ extract 0 0) push__AT11))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT11 #b00)) (bvnot (bvnot (bvcomp N25__AT11 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT11 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT11 reqs__AT11)) ((_ extract 1 1) (bvand N25__AT11 reqs__AT11))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT11 #b00))) (bvand (bvnot (bvcomp N25__AT11 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT11) (bvsub ((_ zero_extend 30) N25__AT11) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT11 ((_ zero_extend 0) N25__AT11)))
(assert (= data_out_vld__AT11 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT11 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT11 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) #b0000)) ((_ extract 0 0) N25__AT11))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT11| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|)) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) ((_ extract 0 0) N25__AT11))))))))))))
(assert (= af.gnt__AT11 ((_ zero_extend 0) N25__AT11)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT11| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT11| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|)))
(assert (= full__AT11 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|)))))))
(assert (= |af.gen_fifos[1].f.full__AT11| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT11| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT11| (concat #b000 ((_ extract 1 1) push__AT11))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT11| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT11| (concat #b000 ((_ extract 1 1) N25__AT11))))))
(assert (= empty__AT11 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT11| |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT11| |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|))))
(assert (= |af.gen_fifos[1].f.empty__AT11| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT11| |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT11| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT11) ((_ extract 1 1) N25__AT11)) rst__AT11))))
(assert (= data_out__AT11 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|)) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) (concat ((_ extract 1 1) N25__AT11) ((_ extract 1 1) N25__AT11))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|)) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) (concat ((_ extract 0 0) N25__AT11) ((_ extract 0 0) N25__AT11))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT11| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT11| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|)))
(assert (= |af.gen_fifos[0].f.full__AT11| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT11| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| (concat #b000 ((_ extract 0 0) push__AT11))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT11| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT11| (concat #b000 ((_ extract 0 0) N25__AT11))))))
(assert (= |af.gen_fifos[0].f.empty__AT11| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT11| |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT11| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT11) ((_ extract 0 0) N25__AT11)) rst__AT11))))
(assert (= |af.fifo_data_out[1]__AT11| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|)))))
(assert (= |af.fifo_data_out[0]__AT11| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|)))))
(assert (= rst__AT11 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT11 (ite (= rst__AT10 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT10) ((_ extract 0 0) N25__AT10)) rst__AT10) sb.ff_en.Q__AT10) #b1) (ite (= rst__AT10 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT10 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT10 #b1000)) ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)))) #b0000)) ((_ extract 0 0) N25__AT10))))) sb.mpt.ff_cnt.Q__AT10))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT11| (ite (= rst__AT10 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT10) ((_ extract 0 0) N25__AT10)) rst__AT10) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT10| (concat #b000 ((_ extract 0 0) N25__AT10))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT10|))))
(assert (= sb.ff_en.Q__AT11 (ite (= rst__AT10 #b1) #b0 (ite (= sb.ff_en.Q__AT10 #b1) #b1 (bvor sb.ff_en.Q__AT10 (bvand start__AT10 ((_ extract 0 0) push__AT10)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| (ite (= rst__AT10 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT10) ((_ extract 0 0) N25__AT10)) rst__AT10) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| (concat #b000 ((_ extract 0 0) push__AT10))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT11| (ite (= rst__AT10 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT10) ((_ extract 1 1) N25__AT10)) rst__AT10) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT10| (concat #b000 ((_ extract 1 1) N25__AT10))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT10|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT11| (ite (= rst__AT10 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT10) ((_ extract 1 1) N25__AT10)) rst__AT10) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT10| (concat #b000 ((_ extract 1 1) push__AT10))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|))))
(assert (= |af.gen_fifos[1].f.entries__AT11| (store |af.gen_fifos[1].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|) (bvor (bvand (concat ((_ extract 1 1) push__AT10) (concat ((_ extract 1 1) push__AT10) (concat ((_ extract 1 1) push__AT10) (concat ((_ extract 1 1) push__AT10) (concat ((_ extract 1 1) push__AT10) (concat ((_ extract 1 1) push__AT10) (concat ((_ extract 1 1) push__AT10) ((_ extract 1 1) push__AT10)))))))) ((_ extract 15 8) flat_data_in__AT10)) (bvand (concat (bvnot ((_ extract 1 1) push__AT10)) (concat (bvnot ((_ extract 1 1) push__AT10)) (concat (bvnot ((_ extract 1 1) push__AT10)) (concat (bvnot ((_ extract 1 1) push__AT10)) (concat (bvnot ((_ extract 1 1) push__AT10)) (concat (bvnot ((_ extract 1 1) push__AT10)) (concat (bvnot ((_ extract 1 1) push__AT10)) (bvnot ((_ extract 1 1) push__AT10))))))))) (select |af.gen_fifos[1].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT10|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT11| (store |af.gen_fifos[0].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|) (bvor (bvand (concat ((_ extract 0 0) push__AT10) (concat ((_ extract 0 0) push__AT10) (concat ((_ extract 0 0) push__AT10) (concat ((_ extract 0 0) push__AT10) (concat ((_ extract 0 0) push__AT10) (concat ((_ extract 0 0) push__AT10) (concat ((_ extract 0 0) push__AT10) ((_ extract 0 0) push__AT10)))))))) ((_ extract 7 0) flat_data_in__AT10)) (bvand (concat (bvnot ((_ extract 0 0) push__AT10)) (concat (bvnot ((_ extract 0 0) push__AT10)) (concat (bvnot ((_ extract 0 0) push__AT10)) (concat (bvnot ((_ extract 0 0) push__AT10)) (concat (bvnot ((_ extract 0 0) push__AT10)) (concat (bvnot ((_ extract 0 0) push__AT10)) (concat (bvnot ((_ extract 0 0) push__AT10)) (bvnot ((_ extract 0 0) push__AT10))))))))) (select |af.gen_fifos[0].f.entries__AT10| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT10|)))))))
(assert (= sb.ff_magic_packet.Q__AT11 (ite (= rst__AT10 #b1) #b00000000 (ite (= (bvand (bvand start__AT10 ((_ extract 0 0) push__AT10)) (bvnot sb.ff_en.Q__AT10)) #b1) ((_ extract 7 0) flat_data_in__AT10) sb.ff_magic_packet.Q__AT10))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT11 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop11 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en2_prop11 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en3_prop11 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en4_prop11 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en5_prop11 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en6_prop11 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en7_prop11 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en8_prop11 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en9_prop11 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en10_prop11 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(define-fun en11_prop11 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT11 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))

(check-sat-assuming ((not (and en1_prop11 en2_prop11 en3_prop11 en4_prop11 en5_prop11 en6_prop11 en7_prop11 en8_prop11 en9_prop11 en10_prop11 en11_prop11))))



(echo "Checking property at bound 11")

(check-sat)

(pop 1)
(declare-fun full__AT12 () (_ BitVec 2))
(declare-fun data_out_vld__AT12 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT12| () (_ BitVec 8))
(declare-fun af.gnt__AT12 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT12| () (_ BitVec 4))
(declare-fun reqs__AT12 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT12| () (_ BitVec 4))
(declare-fun empty__AT12 () (_ BitVec 2))
(declare-fun N25__AT12 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT12| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT12| () (_ BitVec 4))
(declare-fun rst__AT12 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT12| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT12 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT12| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT12| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT12| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT12 () (_ BitVec 1))
(declare-fun data_out__AT12 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT12| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT12| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT12| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT12| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT12| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT12| () (_ BitVec 4))
(declare-fun prop_signal__AT12 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT12| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT12 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT12| () (_ BitVec 1))
(declare-fun flat_data_in__AT11 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT12| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT12 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT12| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT12 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT12| () (_ BitVec 8))
(declare-fun start__AT12 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT12 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT12| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.en__AT12 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT12 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT12| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT12 () (_ BitVec 8))
(declare-fun push__AT12 () (_ BitVec 2))
(declare-fun pop__AT12 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT12)) (bvnot ((_ extract 1 1) push__AT12))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT12)) (bvnot ((_ extract 0 0) push__AT12))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT12)) (bvnot ((_ extract 0 0) reqs__AT12))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT12)) (bvnot ((_ extract 1 1) reqs__AT12))) #b1))
(assert true)
(assert (= prop_signal__AT12 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT12 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT12 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) #b0000)) ((_ extract 0 0) N25__AT12))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT12 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|)) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) ((_ extract 1 1) N25__AT12))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|)) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) ((_ extract 0 0) N25__AT12))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT12 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))))))
(assert (= sb.mpt.ff_cnt.en__AT12 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT12) ((_ extract 0 0) N25__AT12)) rst__AT12) sb.ff_en.Q__AT12))))
(assert (= sb.mpt.ff_cnt.D__AT12 ((_ zero_extend 0) (ite (= rst__AT12 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) #b0000)) ((_ extract 0 0) N25__AT12))))))))
(assert (= sb.ff_magic_packet.en__AT12 ((_ zero_extend 0) (bvand (bvand start__AT12 ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))))
(assert (= sb.ff_en.en__AT12 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT12))))
(assert (= sb.ff_en.D__AT12 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT12 (bvand start__AT12 ((_ extract 0 0) push__AT12))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT12 #b00)) (bvnot (bvnot (bvcomp N25__AT12 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT12 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT12 reqs__AT12)) ((_ extract 1 1) (bvand N25__AT12 reqs__AT12))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT12 #b00))) (bvand (bvnot (bvcomp N25__AT12 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT12) (bvsub ((_ zero_extend 30) N25__AT12) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT12 ((_ zero_extend 0) N25__AT12)))
(assert (= data_out_vld__AT12 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT12 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT12 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) #b0000)) ((_ extract 0 0) N25__AT12))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT12| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|)) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) ((_ extract 0 0) N25__AT12))))))))))))
(assert (= af.gnt__AT12 ((_ zero_extend 0) N25__AT12)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT12| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT12| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|)))
(assert (= full__AT12 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|)))))))
(assert (= |af.gen_fifos[1].f.full__AT12| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT12| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT12| (concat #b000 ((_ extract 1 1) push__AT12))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT12| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT12| (concat #b000 ((_ extract 1 1) N25__AT12))))))
(assert (= empty__AT12 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT12| |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT12| |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|))))
(assert (= |af.gen_fifos[1].f.empty__AT12| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT12| |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT12| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT12) ((_ extract 1 1) N25__AT12)) rst__AT12))))
(assert (= data_out__AT12 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|)) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) (concat ((_ extract 1 1) N25__AT12) ((_ extract 1 1) N25__AT12))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|)) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) (concat ((_ extract 0 0) N25__AT12) ((_ extract 0 0) N25__AT12))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT12| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT12| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|)))
(assert (= |af.gen_fifos[0].f.full__AT12| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT12| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| (concat #b000 ((_ extract 0 0) push__AT12))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT12| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT12| (concat #b000 ((_ extract 0 0) N25__AT12))))))
(assert (= |af.gen_fifos[0].f.empty__AT12| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT12| |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT12| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT12) ((_ extract 0 0) N25__AT12)) rst__AT12))))
(assert (= |af.fifo_data_out[1]__AT12| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|)))))
(assert (= |af.fifo_data_out[0]__AT12| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|)))))
(assert (= rst__AT12 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT12 (ite (= rst__AT11 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT11) ((_ extract 0 0) N25__AT11)) rst__AT11) sb.ff_en.Q__AT11) #b1) (ite (= rst__AT11 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT11 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT11 #b1000)) ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)))) #b0000)) ((_ extract 0 0) N25__AT11))))) sb.mpt.ff_cnt.Q__AT11))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT12| (ite (= rst__AT11 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT11) ((_ extract 0 0) N25__AT11)) rst__AT11) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT11| (concat #b000 ((_ extract 0 0) N25__AT11))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT11|))))
(assert (= sb.ff_en.Q__AT12 (ite (= rst__AT11 #b1) #b0 (ite (= sb.ff_en.Q__AT11 #b1) #b1 (bvor sb.ff_en.Q__AT11 (bvand start__AT11 ((_ extract 0 0) push__AT11)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| (ite (= rst__AT11 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT11) ((_ extract 0 0) N25__AT11)) rst__AT11) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| (concat #b000 ((_ extract 0 0) push__AT11))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT12| (ite (= rst__AT11 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT11) ((_ extract 1 1) N25__AT11)) rst__AT11) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT11| (concat #b000 ((_ extract 1 1) N25__AT11))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT11|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT12| (ite (= rst__AT11 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT11) ((_ extract 1 1) N25__AT11)) rst__AT11) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT11| (concat #b000 ((_ extract 1 1) push__AT11))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|))))
(assert (= |af.gen_fifos[1].f.entries__AT12| (store |af.gen_fifos[1].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|) (bvor (bvand (concat ((_ extract 1 1) push__AT11) (concat ((_ extract 1 1) push__AT11) (concat ((_ extract 1 1) push__AT11) (concat ((_ extract 1 1) push__AT11) (concat ((_ extract 1 1) push__AT11) (concat ((_ extract 1 1) push__AT11) (concat ((_ extract 1 1) push__AT11) ((_ extract 1 1) push__AT11)))))))) ((_ extract 15 8) flat_data_in__AT11)) (bvand (concat (bvnot ((_ extract 1 1) push__AT11)) (concat (bvnot ((_ extract 1 1) push__AT11)) (concat (bvnot ((_ extract 1 1) push__AT11)) (concat (bvnot ((_ extract 1 1) push__AT11)) (concat (bvnot ((_ extract 1 1) push__AT11)) (concat (bvnot ((_ extract 1 1) push__AT11)) (concat (bvnot ((_ extract 1 1) push__AT11)) (bvnot ((_ extract 1 1) push__AT11))))))))) (select |af.gen_fifos[1].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT11|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT12| (store |af.gen_fifos[0].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|) (bvor (bvand (concat ((_ extract 0 0) push__AT11) (concat ((_ extract 0 0) push__AT11) (concat ((_ extract 0 0) push__AT11) (concat ((_ extract 0 0) push__AT11) (concat ((_ extract 0 0) push__AT11) (concat ((_ extract 0 0) push__AT11) (concat ((_ extract 0 0) push__AT11) ((_ extract 0 0) push__AT11)))))))) ((_ extract 7 0) flat_data_in__AT11)) (bvand (concat (bvnot ((_ extract 0 0) push__AT11)) (concat (bvnot ((_ extract 0 0) push__AT11)) (concat (bvnot ((_ extract 0 0) push__AT11)) (concat (bvnot ((_ extract 0 0) push__AT11)) (concat (bvnot ((_ extract 0 0) push__AT11)) (concat (bvnot ((_ extract 0 0) push__AT11)) (concat (bvnot ((_ extract 0 0) push__AT11)) (bvnot ((_ extract 0 0) push__AT11))))))))) (select |af.gen_fifos[0].f.entries__AT11| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT11|)))))))
(assert (= sb.ff_magic_packet.Q__AT12 (ite (= rst__AT11 #b1) #b00000000 (ite (= (bvand (bvand start__AT11 ((_ extract 0 0) push__AT11)) (bvnot sb.ff_en.Q__AT11)) #b1) ((_ extract 7 0) flat_data_in__AT11) sb.ff_magic_packet.Q__AT11))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT12 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop12 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en2_prop12 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en3_prop12 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en4_prop12 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en5_prop12 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en6_prop12 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en7_prop12 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en8_prop12 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en9_prop12 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en10_prop12 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en11_prop12 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(define-fun en12_prop12 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT12 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))

(check-sat-assuming ((not (and en1_prop12 en2_prop12 en3_prop12 en4_prop12 en5_prop12 en6_prop12 en7_prop12 en8_prop12 en9_prop12 en10_prop12 en11_prop12 en12_prop12))))



(echo "Checking property at bound 12")

(check-sat)

(pop 1)
(declare-fun prop_signal__AT13 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT13| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT13 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT13| () (_ BitVec 1))
(declare-fun flat_data_in__AT12 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT13| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT13 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT13| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT13 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT13| () (_ BitVec 8))
(declare-fun start__AT13 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT13| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT13 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT13 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT13 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT13| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT13 () (_ BitVec 8))
(declare-fun push__AT13 () (_ BitVec 2))
(declare-fun pop__AT13 () (_ BitVec 2))
(declare-fun full__AT13 () (_ BitVec 2))
(declare-fun data_out_vld__AT13 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT13| () (_ BitVec 8))
(declare-fun af.gnt__AT13 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT13| () (_ BitVec 4))
(declare-fun reqs__AT13 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT13| () (_ BitVec 4))
(declare-fun empty__AT13 () (_ BitVec 2))
(declare-fun N25__AT13 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT13| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT13| () (_ BitVec 4))
(declare-fun rst__AT13 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT13| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT13 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT13| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT13| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT13| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT13 () (_ BitVec 1))
(declare-fun data_out__AT13 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.full__AT13| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT13| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT13| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT13| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT13| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT13| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT13)) (bvnot ((_ extract 1 1) push__AT13))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT13)) (bvnot ((_ extract 0 0) push__AT13))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT13)) (bvnot ((_ extract 0 0) reqs__AT13))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT13)) (bvnot ((_ extract 1 1) reqs__AT13))) #b1))
(assert true)
(assert (= prop_signal__AT13 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT13 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT13 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) #b0000)) ((_ extract 0 0) N25__AT13))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT13 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|)) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) ((_ extract 1 1) N25__AT13))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|)) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) ((_ extract 0 0) N25__AT13))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT13 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))))))
(assert (= sb.mpt.ff_cnt.en__AT13 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT13) ((_ extract 0 0) N25__AT13)) rst__AT13) sb.ff_en.Q__AT13))))
(assert (= sb.mpt.ff_cnt.D__AT13 ((_ zero_extend 0) (ite (= rst__AT13 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) #b0000)) ((_ extract 0 0) N25__AT13))))))))
(assert (= sb.ff_magic_packet.en__AT13 ((_ zero_extend 0) (bvand (bvand start__AT13 ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))))
(assert (= sb.ff_en.en__AT13 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT13))))
(assert (= sb.ff_en.D__AT13 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT13 (bvand start__AT13 ((_ extract 0 0) push__AT13))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT13 #b00)) (bvnot (bvnot (bvcomp N25__AT13 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT13 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT13 reqs__AT13)) ((_ extract 1 1) (bvand N25__AT13 reqs__AT13))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT13 #b00))) (bvand (bvnot (bvcomp N25__AT13 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT13) (bvsub ((_ zero_extend 30) N25__AT13) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT13 ((_ zero_extend 0) N25__AT13)))
(assert (= data_out_vld__AT13 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT13 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT13 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) #b0000)) ((_ extract 0 0) N25__AT13))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT13| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|)) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) ((_ extract 0 0) N25__AT13))))))))))))
(assert (= af.gnt__AT13 ((_ zero_extend 0) N25__AT13)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT13| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT13| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|)))
(assert (= full__AT13 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|)))))))
(assert (= |af.gen_fifos[1].f.full__AT13| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT13| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT13| (concat #b000 ((_ extract 1 1) push__AT13))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT13| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT13| (concat #b000 ((_ extract 1 1) N25__AT13))))))
(assert (= empty__AT13 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT13| |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT13| |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|))))
(assert (= |af.gen_fifos[1].f.empty__AT13| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT13| |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT13| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT13) ((_ extract 1 1) N25__AT13)) rst__AT13))))
(assert (= data_out__AT13 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|)) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) (concat ((_ extract 1 1) N25__AT13) ((_ extract 1 1) N25__AT13))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|)) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) (concat ((_ extract 0 0) N25__AT13) ((_ extract 0 0) N25__AT13))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT13| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT13| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|)))
(assert (= |af.gen_fifos[0].f.full__AT13| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT13| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| (concat #b000 ((_ extract 0 0) push__AT13))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT13| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT13| (concat #b000 ((_ extract 0 0) N25__AT13))))))
(assert (= |af.gen_fifos[0].f.empty__AT13| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT13| |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT13| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT13) ((_ extract 0 0) N25__AT13)) rst__AT13))))
(assert (= |af.fifo_data_out[1]__AT13| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|)))))
(assert (= |af.fifo_data_out[0]__AT13| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|)))))
(assert (= rst__AT13 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT13 (ite (= rst__AT12 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT12) ((_ extract 0 0) N25__AT12)) rst__AT12) sb.ff_en.Q__AT12) #b1) (ite (= rst__AT12 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT12 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT12 #b1000)) ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)))) #b0000)) ((_ extract 0 0) N25__AT12))))) sb.mpt.ff_cnt.Q__AT12))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT13| (ite (= rst__AT12 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT12) ((_ extract 0 0) N25__AT12)) rst__AT12) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT12| (concat #b000 ((_ extract 0 0) N25__AT12))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT12|))))
(assert (= sb.ff_en.Q__AT13 (ite (= rst__AT12 #b1) #b0 (ite (= sb.ff_en.Q__AT12 #b1) #b1 (bvor sb.ff_en.Q__AT12 (bvand start__AT12 ((_ extract 0 0) push__AT12)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| (ite (= rst__AT12 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT12) ((_ extract 0 0) N25__AT12)) rst__AT12) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| (concat #b000 ((_ extract 0 0) push__AT12))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT13| (ite (= rst__AT12 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT12) ((_ extract 1 1) N25__AT12)) rst__AT12) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT12| (concat #b000 ((_ extract 1 1) N25__AT12))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT12|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT13| (ite (= rst__AT12 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT12) ((_ extract 1 1) N25__AT12)) rst__AT12) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT12| (concat #b000 ((_ extract 1 1) push__AT12))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|))))
(assert (= |af.gen_fifos[1].f.entries__AT13| (store |af.gen_fifos[1].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|) (bvor (bvand (concat ((_ extract 1 1) push__AT12) (concat ((_ extract 1 1) push__AT12) (concat ((_ extract 1 1) push__AT12) (concat ((_ extract 1 1) push__AT12) (concat ((_ extract 1 1) push__AT12) (concat ((_ extract 1 1) push__AT12) (concat ((_ extract 1 1) push__AT12) ((_ extract 1 1) push__AT12)))))))) ((_ extract 15 8) flat_data_in__AT12)) (bvand (concat (bvnot ((_ extract 1 1) push__AT12)) (concat (bvnot ((_ extract 1 1) push__AT12)) (concat (bvnot ((_ extract 1 1) push__AT12)) (concat (bvnot ((_ extract 1 1) push__AT12)) (concat (bvnot ((_ extract 1 1) push__AT12)) (concat (bvnot ((_ extract 1 1) push__AT12)) (concat (bvnot ((_ extract 1 1) push__AT12)) (bvnot ((_ extract 1 1) push__AT12))))))))) (select |af.gen_fifos[1].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT12|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT13| (store |af.gen_fifos[0].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|) (bvor (bvand (concat ((_ extract 0 0) push__AT12) (concat ((_ extract 0 0) push__AT12) (concat ((_ extract 0 0) push__AT12) (concat ((_ extract 0 0) push__AT12) (concat ((_ extract 0 0) push__AT12) (concat ((_ extract 0 0) push__AT12) (concat ((_ extract 0 0) push__AT12) ((_ extract 0 0) push__AT12)))))))) ((_ extract 7 0) flat_data_in__AT12)) (bvand (concat (bvnot ((_ extract 0 0) push__AT12)) (concat (bvnot ((_ extract 0 0) push__AT12)) (concat (bvnot ((_ extract 0 0) push__AT12)) (concat (bvnot ((_ extract 0 0) push__AT12)) (concat (bvnot ((_ extract 0 0) push__AT12)) (concat (bvnot ((_ extract 0 0) push__AT12)) (concat (bvnot ((_ extract 0 0) push__AT12)) (bvnot ((_ extract 0 0) push__AT12))))))))) (select |af.gen_fifos[0].f.entries__AT12| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT12|)))))))
(assert (= sb.ff_magic_packet.Q__AT13 (ite (= rst__AT12 #b1) #b00000000 (ite (= (bvand (bvand start__AT12 ((_ extract 0 0) push__AT12)) (bvnot sb.ff_en.Q__AT12)) #b1) ((_ extract 7 0) flat_data_in__AT12) sb.ff_magic_packet.Q__AT12))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT13 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop13 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en2_prop13 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en3_prop13 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en4_prop13 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en5_prop13 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en6_prop13 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en7_prop13 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en8_prop13 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en9_prop13 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en10_prop13 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en11_prop13 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en12_prop13 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(define-fun en13_prop13 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT13 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))

(check-sat-assuming ((not (and en1_prop13 en2_prop13 en3_prop13 en4_prop13 en5_prop13 en6_prop13 en7_prop13 en8_prop13 en9_prop13 en10_prop13 en11_prop13 en12_prop13 en13_prop13))))



(echo "Checking property at bound 13")

(check-sat)

(pop 1)
(declare-fun N25__AT14 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT14| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT14| () (_ BitVec 4))
(declare-fun rst__AT14 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT14| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT14 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT14| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT14| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT14| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT14 () (_ BitVec 1))
(declare-fun data_out__AT14 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT14| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT14| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT14| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT14| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT14| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT14| () (_ BitVec 4))
(declare-fun prop_signal__AT14 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT14| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT14 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT14| () (_ BitVec 1))
(declare-fun flat_data_in__AT13 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT14| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT14 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT14| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT14 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT14| () (_ BitVec 8))
(declare-fun start__AT14 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT14| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT14 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT14 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT14 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT14| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT14 () (_ BitVec 8))
(declare-fun push__AT14 () (_ BitVec 2))
(declare-fun pop__AT14 () (_ BitVec 2))
(declare-fun full__AT14 () (_ BitVec 2))
(declare-fun data_out_vld__AT14 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT14| () (_ BitVec 8))
(declare-fun af.gnt__AT14 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT14| () (_ BitVec 4))
(declare-fun reqs__AT14 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT14| () (_ BitVec 4))
(declare-fun empty__AT14 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT14)) (bvnot ((_ extract 1 1) push__AT14))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT14)) (bvnot ((_ extract 0 0) push__AT14))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT14)) (bvnot ((_ extract 0 0) reqs__AT14))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT14)) (bvnot ((_ extract 1 1) reqs__AT14))) #b1))
(assert true)
(assert (= prop_signal__AT14 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT14 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT14 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) #b0000)) ((_ extract 0 0) N25__AT14))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT14 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|)) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) ((_ extract 1 1) N25__AT14))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|)) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) ((_ extract 0 0) N25__AT14))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT14 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))))))
(assert (= sb.mpt.ff_cnt.en__AT14 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT14) ((_ extract 0 0) N25__AT14)) rst__AT14) sb.ff_en.Q__AT14))))
(assert (= sb.mpt.ff_cnt.D__AT14 ((_ zero_extend 0) (ite (= rst__AT14 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) #b0000)) ((_ extract 0 0) N25__AT14))))))))
(assert (= sb.ff_magic_packet.en__AT14 ((_ zero_extend 0) (bvand (bvand start__AT14 ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))))
(assert (= sb.ff_en.en__AT14 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT14))))
(assert (= sb.ff_en.D__AT14 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT14 (bvand start__AT14 ((_ extract 0 0) push__AT14))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT14 #b00)) (bvnot (bvnot (bvcomp N25__AT14 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT14 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT14 reqs__AT14)) ((_ extract 1 1) (bvand N25__AT14 reqs__AT14))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT14 #b00))) (bvand (bvnot (bvcomp N25__AT14 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT14) (bvsub ((_ zero_extend 30) N25__AT14) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT14 ((_ zero_extend 0) N25__AT14)))
(assert (= data_out_vld__AT14 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT14 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT14 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) #b0000)) ((_ extract 0 0) N25__AT14))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT14| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|)) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) ((_ extract 0 0) N25__AT14))))))))))))
(assert (= af.gnt__AT14 ((_ zero_extend 0) N25__AT14)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT14| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT14| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|)))
(assert (= full__AT14 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|)))))))
(assert (= |af.gen_fifos[1].f.full__AT14| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT14| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT14| (concat #b000 ((_ extract 1 1) push__AT14))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT14| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT14| (concat #b000 ((_ extract 1 1) N25__AT14))))))
(assert (= empty__AT14 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT14| |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT14| |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|))))
(assert (= |af.gen_fifos[1].f.empty__AT14| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT14| |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT14| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT14) ((_ extract 1 1) N25__AT14)) rst__AT14))))
(assert (= data_out__AT14 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|)) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) (concat ((_ extract 1 1) N25__AT14) ((_ extract 1 1) N25__AT14))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|)) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) (concat ((_ extract 0 0) N25__AT14) ((_ extract 0 0) N25__AT14))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT14| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT14| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|)))
(assert (= |af.gen_fifos[0].f.full__AT14| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT14| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| (concat #b000 ((_ extract 0 0) push__AT14))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT14| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT14| (concat #b000 ((_ extract 0 0) N25__AT14))))))
(assert (= |af.gen_fifos[0].f.empty__AT14| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT14| |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT14| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT14) ((_ extract 0 0) N25__AT14)) rst__AT14))))
(assert (= |af.fifo_data_out[1]__AT14| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|)))))
(assert (= |af.fifo_data_out[0]__AT14| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|)))))
(assert (= rst__AT14 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT14 (ite (= rst__AT13 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT13) ((_ extract 0 0) N25__AT13)) rst__AT13) sb.ff_en.Q__AT13) #b1) (ite (= rst__AT13 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT13 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT13 #b1000)) ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)))) #b0000)) ((_ extract 0 0) N25__AT13))))) sb.mpt.ff_cnt.Q__AT13))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT14| (ite (= rst__AT13 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT13) ((_ extract 0 0) N25__AT13)) rst__AT13) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT13| (concat #b000 ((_ extract 0 0) N25__AT13))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT13|))))
(assert (= sb.ff_en.Q__AT14 (ite (= rst__AT13 #b1) #b0 (ite (= sb.ff_en.Q__AT13 #b1) #b1 (bvor sb.ff_en.Q__AT13 (bvand start__AT13 ((_ extract 0 0) push__AT13)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| (ite (= rst__AT13 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT13) ((_ extract 0 0) N25__AT13)) rst__AT13) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| (concat #b000 ((_ extract 0 0) push__AT13))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT14| (ite (= rst__AT13 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT13) ((_ extract 1 1) N25__AT13)) rst__AT13) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT13| (concat #b000 ((_ extract 1 1) N25__AT13))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT13|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT14| (ite (= rst__AT13 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT13) ((_ extract 1 1) N25__AT13)) rst__AT13) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT13| (concat #b000 ((_ extract 1 1) push__AT13))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|))))
(assert (= |af.gen_fifos[1].f.entries__AT14| (store |af.gen_fifos[1].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|) (bvor (bvand (concat ((_ extract 1 1) push__AT13) (concat ((_ extract 1 1) push__AT13) (concat ((_ extract 1 1) push__AT13) (concat ((_ extract 1 1) push__AT13) (concat ((_ extract 1 1) push__AT13) (concat ((_ extract 1 1) push__AT13) (concat ((_ extract 1 1) push__AT13) ((_ extract 1 1) push__AT13)))))))) ((_ extract 15 8) flat_data_in__AT13)) (bvand (concat (bvnot ((_ extract 1 1) push__AT13)) (concat (bvnot ((_ extract 1 1) push__AT13)) (concat (bvnot ((_ extract 1 1) push__AT13)) (concat (bvnot ((_ extract 1 1) push__AT13)) (concat (bvnot ((_ extract 1 1) push__AT13)) (concat (bvnot ((_ extract 1 1) push__AT13)) (concat (bvnot ((_ extract 1 1) push__AT13)) (bvnot ((_ extract 1 1) push__AT13))))))))) (select |af.gen_fifos[1].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT13|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT14| (store |af.gen_fifos[0].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|) (bvor (bvand (concat ((_ extract 0 0) push__AT13) (concat ((_ extract 0 0) push__AT13) (concat ((_ extract 0 0) push__AT13) (concat ((_ extract 0 0) push__AT13) (concat ((_ extract 0 0) push__AT13) (concat ((_ extract 0 0) push__AT13) (concat ((_ extract 0 0) push__AT13) ((_ extract 0 0) push__AT13)))))))) ((_ extract 7 0) flat_data_in__AT13)) (bvand (concat (bvnot ((_ extract 0 0) push__AT13)) (concat (bvnot ((_ extract 0 0) push__AT13)) (concat (bvnot ((_ extract 0 0) push__AT13)) (concat (bvnot ((_ extract 0 0) push__AT13)) (concat (bvnot ((_ extract 0 0) push__AT13)) (concat (bvnot ((_ extract 0 0) push__AT13)) (concat (bvnot ((_ extract 0 0) push__AT13)) (bvnot ((_ extract 0 0) push__AT13))))))))) (select |af.gen_fifos[0].f.entries__AT13| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT13|)))))))
(assert (= sb.ff_magic_packet.Q__AT14 (ite (= rst__AT13 #b1) #b00000000 (ite (= (bvand (bvand start__AT13 ((_ extract 0 0) push__AT13)) (bvnot sb.ff_en.Q__AT13)) #b1) ((_ extract 7 0) flat_data_in__AT13) sb.ff_magic_packet.Q__AT13))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT14 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop14 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en2_prop14 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en3_prop14 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en4_prop14 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en5_prop14 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en6_prop14 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en7_prop14 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en8_prop14 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en9_prop14 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en10_prop14 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en11_prop14 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en12_prop14 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en13_prop14 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(define-fun en14_prop14 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT14 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))

(check-sat-assuming ((not (and en1_prop14 en2_prop14 en3_prop14 en4_prop14 en5_prop14 en6_prop14 en7_prop14 en8_prop14 en9_prop14 en10_prop14 en11_prop14 en12_prop14 en13_prop14 en14_prop14))))



(echo "Checking property at bound 14")

(check-sat)

(pop 1)
(declare-fun start__AT15 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT15| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT15 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT15 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT15 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT15| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT15 () (_ BitVec 8))
(declare-fun push__AT15 () (_ BitVec 2))
(declare-fun pop__AT15 () (_ BitVec 2))
(declare-fun full__AT15 () (_ BitVec 2))
(declare-fun data_out_vld__AT15 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT15| () (_ BitVec 8))
(declare-fun af.gnt__AT15 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT15| () (_ BitVec 4))
(declare-fun reqs__AT15 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT15| () (_ BitVec 4))
(declare-fun empty__AT15 () (_ BitVec 2))
(declare-fun N25__AT15 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT15| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT15| () (_ BitVec 4))
(declare-fun rst__AT15 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT15| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT15 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT15| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT15| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT15| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT15 () (_ BitVec 1))
(declare-fun data_out__AT15 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT15| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT15| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT15| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT15| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT15| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT15| () (_ BitVec 4))
(declare-fun prop_signal__AT15 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT15| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT15 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT15| () (_ BitVec 1))
(declare-fun flat_data_in__AT14 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT15| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT15 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT15| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT15 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT15| () (_ BitVec 8))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT15)) (bvnot ((_ extract 1 1) push__AT15))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT15)) (bvnot ((_ extract 0 0) push__AT15))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT15)) (bvnot ((_ extract 0 0) reqs__AT15))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT15)) (bvnot ((_ extract 1 1) reqs__AT15))) #b1))
(assert true)
(assert (= prop_signal__AT15 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT15 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT15 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) #b0000)) ((_ extract 0 0) N25__AT15))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT15 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|)) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) ((_ extract 1 1) N25__AT15))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|)) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) ((_ extract 0 0) N25__AT15))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT15 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))))))
(assert (= sb.mpt.ff_cnt.en__AT15 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT15) ((_ extract 0 0) N25__AT15)) rst__AT15) sb.ff_en.Q__AT15))))
(assert (= sb.mpt.ff_cnt.D__AT15 ((_ zero_extend 0) (ite (= rst__AT15 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) #b0000)) ((_ extract 0 0) N25__AT15))))))))
(assert (= sb.ff_magic_packet.en__AT15 ((_ zero_extend 0) (bvand (bvand start__AT15 ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))))
(assert (= sb.ff_en.en__AT15 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT15))))
(assert (= sb.ff_en.D__AT15 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT15 (bvand start__AT15 ((_ extract 0 0) push__AT15))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT15 #b00)) (bvnot (bvnot (bvcomp N25__AT15 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT15 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT15 reqs__AT15)) ((_ extract 1 1) (bvand N25__AT15 reqs__AT15))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT15 #b00))) (bvand (bvnot (bvcomp N25__AT15 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT15) (bvsub ((_ zero_extend 30) N25__AT15) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT15 ((_ zero_extend 0) N25__AT15)))
(assert (= data_out_vld__AT15 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT15 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT15 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) #b0000)) ((_ extract 0 0) N25__AT15))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT15| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|)) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) ((_ extract 0 0) N25__AT15))))))))))))
(assert (= af.gnt__AT15 ((_ zero_extend 0) N25__AT15)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT15| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT15| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|)))
(assert (= full__AT15 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|)))))))
(assert (= |af.gen_fifos[1].f.full__AT15| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT15| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT15| (concat #b000 ((_ extract 1 1) push__AT15))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT15| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT15| (concat #b000 ((_ extract 1 1) N25__AT15))))))
(assert (= empty__AT15 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT15| |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT15| |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|))))
(assert (= |af.gen_fifos[1].f.empty__AT15| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT15| |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT15| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT15) ((_ extract 1 1) N25__AT15)) rst__AT15))))
(assert (= data_out__AT15 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|)) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) (concat ((_ extract 1 1) N25__AT15) ((_ extract 1 1) N25__AT15))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|)) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) (concat ((_ extract 0 0) N25__AT15) ((_ extract 0 0) N25__AT15))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT15| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT15| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|)))
(assert (= |af.gen_fifos[0].f.full__AT15| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT15| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| (concat #b000 ((_ extract 0 0) push__AT15))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT15| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT15| (concat #b000 ((_ extract 0 0) N25__AT15))))))
(assert (= |af.gen_fifos[0].f.empty__AT15| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT15| |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT15| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT15) ((_ extract 0 0) N25__AT15)) rst__AT15))))
(assert (= |af.fifo_data_out[1]__AT15| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|)))))
(assert (= |af.fifo_data_out[0]__AT15| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|)))))
(assert (= rst__AT15 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT15 (ite (= rst__AT14 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT14) ((_ extract 0 0) N25__AT14)) rst__AT14) sb.ff_en.Q__AT14) #b1) (ite (= rst__AT14 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT14 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT14 #b1000)) ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)))) #b0000)) ((_ extract 0 0) N25__AT14))))) sb.mpt.ff_cnt.Q__AT14))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT15| (ite (= rst__AT14 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT14) ((_ extract 0 0) N25__AT14)) rst__AT14) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT14| (concat #b000 ((_ extract 0 0) N25__AT14))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT14|))))
(assert (= sb.ff_en.Q__AT15 (ite (= rst__AT14 #b1) #b0 (ite (= sb.ff_en.Q__AT14 #b1) #b1 (bvor sb.ff_en.Q__AT14 (bvand start__AT14 ((_ extract 0 0) push__AT14)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| (ite (= rst__AT14 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT14) ((_ extract 0 0) N25__AT14)) rst__AT14) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| (concat #b000 ((_ extract 0 0) push__AT14))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT15| (ite (= rst__AT14 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT14) ((_ extract 1 1) N25__AT14)) rst__AT14) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT14| (concat #b000 ((_ extract 1 1) N25__AT14))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT14|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT15| (ite (= rst__AT14 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT14) ((_ extract 1 1) N25__AT14)) rst__AT14) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT14| (concat #b000 ((_ extract 1 1) push__AT14))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|))))
(assert (= |af.gen_fifos[1].f.entries__AT15| (store |af.gen_fifos[1].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|) (bvor (bvand (concat ((_ extract 1 1) push__AT14) (concat ((_ extract 1 1) push__AT14) (concat ((_ extract 1 1) push__AT14) (concat ((_ extract 1 1) push__AT14) (concat ((_ extract 1 1) push__AT14) (concat ((_ extract 1 1) push__AT14) (concat ((_ extract 1 1) push__AT14) ((_ extract 1 1) push__AT14)))))))) ((_ extract 15 8) flat_data_in__AT14)) (bvand (concat (bvnot ((_ extract 1 1) push__AT14)) (concat (bvnot ((_ extract 1 1) push__AT14)) (concat (bvnot ((_ extract 1 1) push__AT14)) (concat (bvnot ((_ extract 1 1) push__AT14)) (concat (bvnot ((_ extract 1 1) push__AT14)) (concat (bvnot ((_ extract 1 1) push__AT14)) (concat (bvnot ((_ extract 1 1) push__AT14)) (bvnot ((_ extract 1 1) push__AT14))))))))) (select |af.gen_fifos[1].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT14|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT15| (store |af.gen_fifos[0].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|) (bvor (bvand (concat ((_ extract 0 0) push__AT14) (concat ((_ extract 0 0) push__AT14) (concat ((_ extract 0 0) push__AT14) (concat ((_ extract 0 0) push__AT14) (concat ((_ extract 0 0) push__AT14) (concat ((_ extract 0 0) push__AT14) (concat ((_ extract 0 0) push__AT14) ((_ extract 0 0) push__AT14)))))))) ((_ extract 7 0) flat_data_in__AT14)) (bvand (concat (bvnot ((_ extract 0 0) push__AT14)) (concat (bvnot ((_ extract 0 0) push__AT14)) (concat (bvnot ((_ extract 0 0) push__AT14)) (concat (bvnot ((_ extract 0 0) push__AT14)) (concat (bvnot ((_ extract 0 0) push__AT14)) (concat (bvnot ((_ extract 0 0) push__AT14)) (concat (bvnot ((_ extract 0 0) push__AT14)) (bvnot ((_ extract 0 0) push__AT14))))))))) (select |af.gen_fifos[0].f.entries__AT14| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT14|)))))))
(assert (= sb.ff_magic_packet.Q__AT15 (ite (= rst__AT14 #b1) #b00000000 (ite (= (bvand (bvand start__AT14 ((_ extract 0 0) push__AT14)) (bvnot sb.ff_en.Q__AT14)) #b1) ((_ extract 7 0) flat_data_in__AT14) sb.ff_magic_packet.Q__AT14))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT15 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop15 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en2_prop15 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en3_prop15 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en4_prop15 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en5_prop15 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en6_prop15 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en7_prop15 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en8_prop15 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en9_prop15 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en10_prop15 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en11_prop15 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en12_prop15 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en13_prop15 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en14_prop15 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(define-fun en15_prop15 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT15 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))

(check-sat-assuming ((not (and en1_prop15 en2_prop15 en3_prop15 en4_prop15 en5_prop15 en6_prop15 en7_prop15 en8_prop15 en9_prop15 en10_prop15 en11_prop15 en12_prop15 en13_prop15 en14_prop15 en15_prop15))))



(echo "Checking property at bound 15")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.full__AT16| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT16| () (_ BitVec 4))
(declare-fun rst__AT16 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT16| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT16 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT16| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT16| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT16| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT16 () (_ BitVec 1))
(declare-fun data_out__AT16 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT16| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT16| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT16| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT16| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT16| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT16| () (_ BitVec 4))
(declare-fun prop_signal__AT16 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT16| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT16 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT16| () (_ BitVec 1))
(declare-fun flat_data_in__AT15 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT16| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT16 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT16| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT16 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT16| () (_ BitVec 8))
(declare-fun start__AT16 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT16 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT16| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.en__AT16 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT16 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT16| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT16 () (_ BitVec 8))
(declare-fun push__AT16 () (_ BitVec 2))
(declare-fun pop__AT16 () (_ BitVec 2))
(declare-fun full__AT16 () (_ BitVec 2))
(declare-fun data_out_vld__AT16 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT16| () (_ BitVec 8))
(declare-fun af.gnt__AT16 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT16| () (_ BitVec 4))
(declare-fun reqs__AT16 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT16| () (_ BitVec 4))
(declare-fun empty__AT16 () (_ BitVec 2))
(declare-fun N25__AT16 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT16)) (bvnot ((_ extract 1 1) push__AT16))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT16)) (bvnot ((_ extract 0 0) push__AT16))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT16)) (bvnot ((_ extract 0 0) reqs__AT16))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT16)) (bvnot ((_ extract 1 1) reqs__AT16))) #b1))
(assert true)
(assert (= prop_signal__AT16 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT16 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT16 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) #b0000)) ((_ extract 0 0) N25__AT16))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT16 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|)) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) ((_ extract 1 1) N25__AT16))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|)) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) ((_ extract 0 0) N25__AT16))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT16 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))))))
(assert (= sb.mpt.ff_cnt.en__AT16 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT16) ((_ extract 0 0) N25__AT16)) rst__AT16) sb.ff_en.Q__AT16))))
(assert (= sb.mpt.ff_cnt.D__AT16 ((_ zero_extend 0) (ite (= rst__AT16 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) #b0000)) ((_ extract 0 0) N25__AT16))))))))
(assert (= sb.ff_magic_packet.en__AT16 ((_ zero_extend 0) (bvand (bvand start__AT16 ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))))
(assert (= sb.ff_en.en__AT16 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT16))))
(assert (= sb.ff_en.D__AT16 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT16 (bvand start__AT16 ((_ extract 0 0) push__AT16))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT16 #b00)) (bvnot (bvnot (bvcomp N25__AT16 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT16 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT16 reqs__AT16)) ((_ extract 1 1) (bvand N25__AT16 reqs__AT16))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT16 #b00))) (bvand (bvnot (bvcomp N25__AT16 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT16) (bvsub ((_ zero_extend 30) N25__AT16) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT16 ((_ zero_extend 0) N25__AT16)))
(assert (= data_out_vld__AT16 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT16 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT16 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) #b0000)) ((_ extract 0 0) N25__AT16))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT16| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|)) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) ((_ extract 0 0) N25__AT16))))))))))))
(assert (= af.gnt__AT16 ((_ zero_extend 0) N25__AT16)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT16| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT16| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|)))
(assert (= full__AT16 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|)))))))
(assert (= |af.gen_fifos[1].f.full__AT16| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT16| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT16| (concat #b000 ((_ extract 1 1) push__AT16))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT16| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT16| (concat #b000 ((_ extract 1 1) N25__AT16))))))
(assert (= empty__AT16 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT16| |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT16| |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|))))
(assert (= |af.gen_fifos[1].f.empty__AT16| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT16| |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT16| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT16) ((_ extract 1 1) N25__AT16)) rst__AT16))))
(assert (= data_out__AT16 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|)) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) (concat ((_ extract 1 1) N25__AT16) ((_ extract 1 1) N25__AT16))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|)) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) (concat ((_ extract 0 0) N25__AT16) ((_ extract 0 0) N25__AT16))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT16| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT16| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|)))
(assert (= |af.gen_fifos[0].f.full__AT16| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT16| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| (concat #b000 ((_ extract 0 0) push__AT16))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT16| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT16| (concat #b000 ((_ extract 0 0) N25__AT16))))))
(assert (= |af.gen_fifos[0].f.empty__AT16| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT16| |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT16| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT16) ((_ extract 0 0) N25__AT16)) rst__AT16))))
(assert (= |af.fifo_data_out[1]__AT16| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|)))))
(assert (= |af.fifo_data_out[0]__AT16| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|)))))
(assert (= rst__AT16 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT16 (ite (= rst__AT15 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT15) ((_ extract 0 0) N25__AT15)) rst__AT15) sb.ff_en.Q__AT15) #b1) (ite (= rst__AT15 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT15 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT15 #b1000)) ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)))) #b0000)) ((_ extract 0 0) N25__AT15))))) sb.mpt.ff_cnt.Q__AT15))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT16| (ite (= rst__AT15 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT15) ((_ extract 0 0) N25__AT15)) rst__AT15) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT15| (concat #b000 ((_ extract 0 0) N25__AT15))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT15|))))
(assert (= sb.ff_en.Q__AT16 (ite (= rst__AT15 #b1) #b0 (ite (= sb.ff_en.Q__AT15 #b1) #b1 (bvor sb.ff_en.Q__AT15 (bvand start__AT15 ((_ extract 0 0) push__AT15)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| (ite (= rst__AT15 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT15) ((_ extract 0 0) N25__AT15)) rst__AT15) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| (concat #b000 ((_ extract 0 0) push__AT15))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT16| (ite (= rst__AT15 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT15) ((_ extract 1 1) N25__AT15)) rst__AT15) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT15| (concat #b000 ((_ extract 1 1) N25__AT15))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT15|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT16| (ite (= rst__AT15 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT15) ((_ extract 1 1) N25__AT15)) rst__AT15) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT15| (concat #b000 ((_ extract 1 1) push__AT15))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|))))
(assert (= |af.gen_fifos[1].f.entries__AT16| (store |af.gen_fifos[1].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|) (bvor (bvand (concat ((_ extract 1 1) push__AT15) (concat ((_ extract 1 1) push__AT15) (concat ((_ extract 1 1) push__AT15) (concat ((_ extract 1 1) push__AT15) (concat ((_ extract 1 1) push__AT15) (concat ((_ extract 1 1) push__AT15) (concat ((_ extract 1 1) push__AT15) ((_ extract 1 1) push__AT15)))))))) ((_ extract 15 8) flat_data_in__AT15)) (bvand (concat (bvnot ((_ extract 1 1) push__AT15)) (concat (bvnot ((_ extract 1 1) push__AT15)) (concat (bvnot ((_ extract 1 1) push__AT15)) (concat (bvnot ((_ extract 1 1) push__AT15)) (concat (bvnot ((_ extract 1 1) push__AT15)) (concat (bvnot ((_ extract 1 1) push__AT15)) (concat (bvnot ((_ extract 1 1) push__AT15)) (bvnot ((_ extract 1 1) push__AT15))))))))) (select |af.gen_fifos[1].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT15|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT16| (store |af.gen_fifos[0].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|) (bvor (bvand (concat ((_ extract 0 0) push__AT15) (concat ((_ extract 0 0) push__AT15) (concat ((_ extract 0 0) push__AT15) (concat ((_ extract 0 0) push__AT15) (concat ((_ extract 0 0) push__AT15) (concat ((_ extract 0 0) push__AT15) (concat ((_ extract 0 0) push__AT15) ((_ extract 0 0) push__AT15)))))))) ((_ extract 7 0) flat_data_in__AT15)) (bvand (concat (bvnot ((_ extract 0 0) push__AT15)) (concat (bvnot ((_ extract 0 0) push__AT15)) (concat (bvnot ((_ extract 0 0) push__AT15)) (concat (bvnot ((_ extract 0 0) push__AT15)) (concat (bvnot ((_ extract 0 0) push__AT15)) (concat (bvnot ((_ extract 0 0) push__AT15)) (concat (bvnot ((_ extract 0 0) push__AT15)) (bvnot ((_ extract 0 0) push__AT15))))))))) (select |af.gen_fifos[0].f.entries__AT15| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT15|)))))))
(assert (= sb.ff_magic_packet.Q__AT16 (ite (= rst__AT15 #b1) #b00000000 (ite (= (bvand (bvand start__AT15 ((_ extract 0 0) push__AT15)) (bvnot sb.ff_en.Q__AT15)) #b1) ((_ extract 7 0) flat_data_in__AT15) sb.ff_magic_packet.Q__AT15))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT16 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop16 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en2_prop16 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en3_prop16 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en4_prop16 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en5_prop16 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en6_prop16 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en7_prop16 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en8_prop16 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en9_prop16 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en10_prop16 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en11_prop16 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en12_prop16 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en13_prop16 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en14_prop16 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en15_prop16 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(define-fun en16_prop16 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT16 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))

(check-sat-assuming ((not (and en1_prop16 en2_prop16 en3_prop16 en4_prop16 en5_prop16 en6_prop16 en7_prop16 en8_prop16 en9_prop16 en10_prop16 en11_prop16 en12_prop16 en13_prop16 en14_prop16 en15_prop16 en16_prop16))))



(echo "Checking property at bound 16")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[0].f.entries__AT17| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT17 () (_ BitVec 8))
(declare-fun push__AT17 () (_ BitVec 2))
(declare-fun pop__AT17 () (_ BitVec 2))
(declare-fun full__AT17 () (_ BitVec 2))
(declare-fun data_out_vld__AT17 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT17| () (_ BitVec 8))
(declare-fun af.gnt__AT17 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT17| () (_ BitVec 4))
(declare-fun reqs__AT17 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT17| () (_ BitVec 4))
(declare-fun empty__AT17 () (_ BitVec 2))
(declare-fun N25__AT17 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT17| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT17| () (_ BitVec 4))
(declare-fun rst__AT17 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT17| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT17 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT17| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT17| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT17| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT17 () (_ BitVec 1))
(declare-fun data_out__AT17 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT17| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT17| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT17| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT17| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT17| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT17| () (_ BitVec 4))
(declare-fun prop_signal__AT17 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT17| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT17 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT17| () (_ BitVec 1))
(declare-fun flat_data_in__AT16 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT17| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT17 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT17| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT17 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT17| () (_ BitVec 8))
(declare-fun start__AT17 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT17| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT17 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT17 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT17 () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT17)) (bvnot ((_ extract 1 1) push__AT17))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT17)) (bvnot ((_ extract 0 0) push__AT17))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT17)) (bvnot ((_ extract 0 0) reqs__AT17))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT17)) (bvnot ((_ extract 1 1) reqs__AT17))) #b1))
(assert true)
(assert (= prop_signal__AT17 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT17 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT17 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) #b0000)) ((_ extract 0 0) N25__AT17))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT17 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|)) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) ((_ extract 1 1) N25__AT17))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|)) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) ((_ extract 0 0) N25__AT17))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT17 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))))))
(assert (= sb.mpt.ff_cnt.en__AT17 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT17) ((_ extract 0 0) N25__AT17)) rst__AT17) sb.ff_en.Q__AT17))))
(assert (= sb.mpt.ff_cnt.D__AT17 ((_ zero_extend 0) (ite (= rst__AT17 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) #b0000)) ((_ extract 0 0) N25__AT17))))))))
(assert (= sb.ff_magic_packet.en__AT17 ((_ zero_extend 0) (bvand (bvand start__AT17 ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))))
(assert (= sb.ff_en.en__AT17 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT17))))
(assert (= sb.ff_en.D__AT17 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT17 (bvand start__AT17 ((_ extract 0 0) push__AT17))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT17 #b00)) (bvnot (bvnot (bvcomp N25__AT17 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT17 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT17 reqs__AT17)) ((_ extract 1 1) (bvand N25__AT17 reqs__AT17))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT17 #b00))) (bvand (bvnot (bvcomp N25__AT17 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT17) (bvsub ((_ zero_extend 30) N25__AT17) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT17 ((_ zero_extend 0) N25__AT17)))
(assert (= data_out_vld__AT17 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT17 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT17 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) #b0000)) ((_ extract 0 0) N25__AT17))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT17| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|)) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) ((_ extract 0 0) N25__AT17))))))))))))
(assert (= af.gnt__AT17 ((_ zero_extend 0) N25__AT17)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT17| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT17| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|)))
(assert (= full__AT17 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|)))))))
(assert (= |af.gen_fifos[1].f.full__AT17| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT17| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT17| (concat #b000 ((_ extract 1 1) push__AT17))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT17| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT17| (concat #b000 ((_ extract 1 1) N25__AT17))))))
(assert (= empty__AT17 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT17| |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT17| |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|))))
(assert (= |af.gen_fifos[1].f.empty__AT17| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT17| |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT17| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT17) ((_ extract 1 1) N25__AT17)) rst__AT17))))
(assert (= data_out__AT17 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|)) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) (concat ((_ extract 1 1) N25__AT17) ((_ extract 1 1) N25__AT17))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|)) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) (concat ((_ extract 0 0) N25__AT17) ((_ extract 0 0) N25__AT17))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT17| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT17| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|)))
(assert (= |af.gen_fifos[0].f.full__AT17| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT17| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| (concat #b000 ((_ extract 0 0) push__AT17))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT17| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT17| (concat #b000 ((_ extract 0 0) N25__AT17))))))
(assert (= |af.gen_fifos[0].f.empty__AT17| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT17| |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT17| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT17) ((_ extract 0 0) N25__AT17)) rst__AT17))))
(assert (= |af.fifo_data_out[1]__AT17| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|)))))
(assert (= |af.fifo_data_out[0]__AT17| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|)))))
(assert (= rst__AT17 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT17 (ite (= rst__AT16 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT16) ((_ extract 0 0) N25__AT16)) rst__AT16) sb.ff_en.Q__AT16) #b1) (ite (= rst__AT16 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT16 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT16 #b1000)) ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)))) #b0000)) ((_ extract 0 0) N25__AT16))))) sb.mpt.ff_cnt.Q__AT16))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT17| (ite (= rst__AT16 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT16) ((_ extract 0 0) N25__AT16)) rst__AT16) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT16| (concat #b000 ((_ extract 0 0) N25__AT16))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT16|))))
(assert (= sb.ff_en.Q__AT17 (ite (= rst__AT16 #b1) #b0 (ite (= sb.ff_en.Q__AT16 #b1) #b1 (bvor sb.ff_en.Q__AT16 (bvand start__AT16 ((_ extract 0 0) push__AT16)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| (ite (= rst__AT16 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT16) ((_ extract 0 0) N25__AT16)) rst__AT16) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| (concat #b000 ((_ extract 0 0) push__AT16))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT17| (ite (= rst__AT16 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT16) ((_ extract 1 1) N25__AT16)) rst__AT16) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT16| (concat #b000 ((_ extract 1 1) N25__AT16))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT16|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT17| (ite (= rst__AT16 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT16) ((_ extract 1 1) N25__AT16)) rst__AT16) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT16| (concat #b000 ((_ extract 1 1) push__AT16))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|))))
(assert (= |af.gen_fifos[1].f.entries__AT17| (store |af.gen_fifos[1].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|) (bvor (bvand (concat ((_ extract 1 1) push__AT16) (concat ((_ extract 1 1) push__AT16) (concat ((_ extract 1 1) push__AT16) (concat ((_ extract 1 1) push__AT16) (concat ((_ extract 1 1) push__AT16) (concat ((_ extract 1 1) push__AT16) (concat ((_ extract 1 1) push__AT16) ((_ extract 1 1) push__AT16)))))))) ((_ extract 15 8) flat_data_in__AT16)) (bvand (concat (bvnot ((_ extract 1 1) push__AT16)) (concat (bvnot ((_ extract 1 1) push__AT16)) (concat (bvnot ((_ extract 1 1) push__AT16)) (concat (bvnot ((_ extract 1 1) push__AT16)) (concat (bvnot ((_ extract 1 1) push__AT16)) (concat (bvnot ((_ extract 1 1) push__AT16)) (concat (bvnot ((_ extract 1 1) push__AT16)) (bvnot ((_ extract 1 1) push__AT16))))))))) (select |af.gen_fifos[1].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT16|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT17| (store |af.gen_fifos[0].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|) (bvor (bvand (concat ((_ extract 0 0) push__AT16) (concat ((_ extract 0 0) push__AT16) (concat ((_ extract 0 0) push__AT16) (concat ((_ extract 0 0) push__AT16) (concat ((_ extract 0 0) push__AT16) (concat ((_ extract 0 0) push__AT16) (concat ((_ extract 0 0) push__AT16) ((_ extract 0 0) push__AT16)))))))) ((_ extract 7 0) flat_data_in__AT16)) (bvand (concat (bvnot ((_ extract 0 0) push__AT16)) (concat (bvnot ((_ extract 0 0) push__AT16)) (concat (bvnot ((_ extract 0 0) push__AT16)) (concat (bvnot ((_ extract 0 0) push__AT16)) (concat (bvnot ((_ extract 0 0) push__AT16)) (concat (bvnot ((_ extract 0 0) push__AT16)) (concat (bvnot ((_ extract 0 0) push__AT16)) (bvnot ((_ extract 0 0) push__AT16))))))))) (select |af.gen_fifos[0].f.entries__AT16| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT16|)))))))
(assert (= sb.ff_magic_packet.Q__AT17 (ite (= rst__AT16 #b1) #b00000000 (ite (= (bvand (bvand start__AT16 ((_ extract 0 0) push__AT16)) (bvnot sb.ff_en.Q__AT16)) #b1) ((_ extract 7 0) flat_data_in__AT16) sb.ff_magic_packet.Q__AT16))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT17 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop17 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en2_prop17 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en3_prop17 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en4_prop17 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en5_prop17 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en6_prop17 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en7_prop17 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en8_prop17 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en9_prop17 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en10_prop17 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en11_prop17 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en12_prop17 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en13_prop17 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en14_prop17 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en15_prop17 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en16_prop17 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(define-fun en17_prop17 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT17 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))

(check-sat-assuming ((not (and en1_prop17 en2_prop17 en3_prop17 en4_prop17 en5_prop17 en6_prop17 en7_prop17 en8_prop17 en9_prop17 en10_prop17 en11_prop17 en12_prop17 en13_prop17 en14_prop17 en15_prop17 en16_prop17 en17_prop17))))



(echo "Checking property at bound 17")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.empty__AT18| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT18| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT18| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT18 () (_ BitVec 1))
(declare-fun data_out__AT18 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT18| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT18| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT18| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT18| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT18| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT18| () (_ BitVec 4))
(declare-fun prop_signal__AT18 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT18| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT18 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT18| () (_ BitVec 1))
(declare-fun flat_data_in__AT17 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT18| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT18 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT18| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT18 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT18| () (_ BitVec 8))
(declare-fun start__AT18 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT18| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT18 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT18 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT18 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT18| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT18 () (_ BitVec 8))
(declare-fun push__AT18 () (_ BitVec 2))
(declare-fun pop__AT18 () (_ BitVec 2))
(declare-fun full__AT18 () (_ BitVec 2))
(declare-fun data_out_vld__AT18 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT18| () (_ BitVec 8))
(declare-fun af.gnt__AT18 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT18| () (_ BitVec 4))
(declare-fun reqs__AT18 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT18| () (_ BitVec 4))
(declare-fun empty__AT18 () (_ BitVec 2))
(declare-fun N25__AT18 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT18| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT18| () (_ BitVec 4))
(declare-fun rst__AT18 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT18| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT18 () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT18)) (bvnot ((_ extract 1 1) push__AT18))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT18)) (bvnot ((_ extract 0 0) push__AT18))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT18)) (bvnot ((_ extract 0 0) reqs__AT18))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT18)) (bvnot ((_ extract 1 1) reqs__AT18))) #b1))
(assert true)
(assert (= prop_signal__AT18 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT18 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT18 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) #b0000)) ((_ extract 0 0) N25__AT18))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT18 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|)) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) ((_ extract 1 1) N25__AT18))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|)) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) ((_ extract 0 0) N25__AT18))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT18 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))))))
(assert (= sb.mpt.ff_cnt.en__AT18 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT18) ((_ extract 0 0) N25__AT18)) rst__AT18) sb.ff_en.Q__AT18))))
(assert (= sb.mpt.ff_cnt.D__AT18 ((_ zero_extend 0) (ite (= rst__AT18 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) #b0000)) ((_ extract 0 0) N25__AT18))))))))
(assert (= sb.ff_magic_packet.en__AT18 ((_ zero_extend 0) (bvand (bvand start__AT18 ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))))
(assert (= sb.ff_en.en__AT18 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT18))))
(assert (= sb.ff_en.D__AT18 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT18 (bvand start__AT18 ((_ extract 0 0) push__AT18))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT18 #b00)) (bvnot (bvnot (bvcomp N25__AT18 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT18 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT18 reqs__AT18)) ((_ extract 1 1) (bvand N25__AT18 reqs__AT18))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT18 #b00))) (bvand (bvnot (bvcomp N25__AT18 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT18) (bvsub ((_ zero_extend 30) N25__AT18) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT18 ((_ zero_extend 0) N25__AT18)))
(assert (= data_out_vld__AT18 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT18 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT18 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) #b0000)) ((_ extract 0 0) N25__AT18))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT18| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|)) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) ((_ extract 0 0) N25__AT18))))))))))))
(assert (= af.gnt__AT18 ((_ zero_extend 0) N25__AT18)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT18| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT18| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|)))
(assert (= full__AT18 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|)))))))
(assert (= |af.gen_fifos[1].f.full__AT18| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT18| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT18| (concat #b000 ((_ extract 1 1) push__AT18))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT18| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT18| (concat #b000 ((_ extract 1 1) N25__AT18))))))
(assert (= empty__AT18 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT18| |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT18| |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|))))
(assert (= |af.gen_fifos[1].f.empty__AT18| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT18| |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT18| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT18) ((_ extract 1 1) N25__AT18)) rst__AT18))))
(assert (= data_out__AT18 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|)) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) (concat ((_ extract 1 1) N25__AT18) ((_ extract 1 1) N25__AT18))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|)) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) (concat ((_ extract 0 0) N25__AT18) ((_ extract 0 0) N25__AT18))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT18| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT18| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|)))
(assert (= |af.gen_fifos[0].f.full__AT18| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT18| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| (concat #b000 ((_ extract 0 0) push__AT18))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT18| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT18| (concat #b000 ((_ extract 0 0) N25__AT18))))))
(assert (= |af.gen_fifos[0].f.empty__AT18| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT18| |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT18| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT18) ((_ extract 0 0) N25__AT18)) rst__AT18))))
(assert (= |af.fifo_data_out[1]__AT18| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|)))))
(assert (= |af.fifo_data_out[0]__AT18| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|)))))
(assert (= rst__AT18 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT18 (ite (= rst__AT17 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT17) ((_ extract 0 0) N25__AT17)) rst__AT17) sb.ff_en.Q__AT17) #b1) (ite (= rst__AT17 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT17 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT17 #b1000)) ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)))) #b0000)) ((_ extract 0 0) N25__AT17))))) sb.mpt.ff_cnt.Q__AT17))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT18| (ite (= rst__AT17 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT17) ((_ extract 0 0) N25__AT17)) rst__AT17) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT17| (concat #b000 ((_ extract 0 0) N25__AT17))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT17|))))
(assert (= sb.ff_en.Q__AT18 (ite (= rst__AT17 #b1) #b0 (ite (= sb.ff_en.Q__AT17 #b1) #b1 (bvor sb.ff_en.Q__AT17 (bvand start__AT17 ((_ extract 0 0) push__AT17)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| (ite (= rst__AT17 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT17) ((_ extract 0 0) N25__AT17)) rst__AT17) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| (concat #b000 ((_ extract 0 0) push__AT17))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT18| (ite (= rst__AT17 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT17) ((_ extract 1 1) N25__AT17)) rst__AT17) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT17| (concat #b000 ((_ extract 1 1) N25__AT17))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT17|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT18| (ite (= rst__AT17 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT17) ((_ extract 1 1) N25__AT17)) rst__AT17) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT17| (concat #b000 ((_ extract 1 1) push__AT17))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|))))
(assert (= |af.gen_fifos[1].f.entries__AT18| (store |af.gen_fifos[1].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|) (bvor (bvand (concat ((_ extract 1 1) push__AT17) (concat ((_ extract 1 1) push__AT17) (concat ((_ extract 1 1) push__AT17) (concat ((_ extract 1 1) push__AT17) (concat ((_ extract 1 1) push__AT17) (concat ((_ extract 1 1) push__AT17) (concat ((_ extract 1 1) push__AT17) ((_ extract 1 1) push__AT17)))))))) ((_ extract 15 8) flat_data_in__AT17)) (bvand (concat (bvnot ((_ extract 1 1) push__AT17)) (concat (bvnot ((_ extract 1 1) push__AT17)) (concat (bvnot ((_ extract 1 1) push__AT17)) (concat (bvnot ((_ extract 1 1) push__AT17)) (concat (bvnot ((_ extract 1 1) push__AT17)) (concat (bvnot ((_ extract 1 1) push__AT17)) (concat (bvnot ((_ extract 1 1) push__AT17)) (bvnot ((_ extract 1 1) push__AT17))))))))) (select |af.gen_fifos[1].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT17|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT18| (store |af.gen_fifos[0].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|) (bvor (bvand (concat ((_ extract 0 0) push__AT17) (concat ((_ extract 0 0) push__AT17) (concat ((_ extract 0 0) push__AT17) (concat ((_ extract 0 0) push__AT17) (concat ((_ extract 0 0) push__AT17) (concat ((_ extract 0 0) push__AT17) (concat ((_ extract 0 0) push__AT17) ((_ extract 0 0) push__AT17)))))))) ((_ extract 7 0) flat_data_in__AT17)) (bvand (concat (bvnot ((_ extract 0 0) push__AT17)) (concat (bvnot ((_ extract 0 0) push__AT17)) (concat (bvnot ((_ extract 0 0) push__AT17)) (concat (bvnot ((_ extract 0 0) push__AT17)) (concat (bvnot ((_ extract 0 0) push__AT17)) (concat (bvnot ((_ extract 0 0) push__AT17)) (concat (bvnot ((_ extract 0 0) push__AT17)) (bvnot ((_ extract 0 0) push__AT17))))))))) (select |af.gen_fifos[0].f.entries__AT17| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT17|)))))))
(assert (= sb.ff_magic_packet.Q__AT18 (ite (= rst__AT17 #b1) #b00000000 (ite (= (bvand (bvand start__AT17 ((_ extract 0 0) push__AT17)) (bvnot sb.ff_en.Q__AT17)) #b1) ((_ extract 7 0) flat_data_in__AT17) sb.ff_magic_packet.Q__AT17))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT18 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop18 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en2_prop18 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en3_prop18 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en4_prop18 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en5_prop18 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en6_prop18 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en7_prop18 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en8_prop18 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en9_prop18 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en10_prop18 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en11_prop18 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en12_prop18 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en13_prop18 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en14_prop18 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en15_prop18 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en16_prop18 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en17_prop18 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(define-fun en18_prop18 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT18 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))

(check-sat-assuming ((not (and en1_prop18 en2_prop18 en3_prop18 en4_prop18 en5_prop18 en6_prop18 en7_prop18 en8_prop18 en9_prop18 en10_prop18 en11_prop18 en12_prop18 en13_prop18 en14_prop18 en15_prop18 en16_prop18 en17_prop18 en18_prop18))))



(echo "Checking property at bound 18")

(check-sat)

(pop 1)
(declare-fun push__AT19 () (_ BitVec 2))
(declare-fun pop__AT19 () (_ BitVec 2))
(declare-fun full__AT19 () (_ BitVec 2))
(declare-fun data_out_vld__AT19 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT19| () (_ BitVec 8))
(declare-fun af.gnt__AT19 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT19| () (_ BitVec 4))
(declare-fun reqs__AT19 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT19| () (_ BitVec 4))
(declare-fun empty__AT19 () (_ BitVec 2))
(declare-fun N25__AT19 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT19| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT19| () (_ BitVec 4))
(declare-fun rst__AT19 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT19| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT19 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT19| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT19| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT19| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT19 () (_ BitVec 1))
(declare-fun data_out__AT19 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT19| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT19| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT19| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT19| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT19| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT19| () (_ BitVec 4))
(declare-fun prop_signal__AT19 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT19| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT19 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT19| () (_ BitVec 1))
(declare-fun flat_data_in__AT18 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT19| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT19 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT19| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT19 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT19| () (_ BitVec 8))
(declare-fun start__AT19 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT19| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT19 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT19 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT19 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT19| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT19 () (_ BitVec 8))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT19)) (bvnot ((_ extract 1 1) push__AT19))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT19)) (bvnot ((_ extract 0 0) push__AT19))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT19)) (bvnot ((_ extract 0 0) reqs__AT19))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT19)) (bvnot ((_ extract 1 1) reqs__AT19))) #b1))
(assert true)
(assert (= prop_signal__AT19 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT19 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT19 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) #b0000)) ((_ extract 0 0) N25__AT19))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT19 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|)) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) ((_ extract 1 1) N25__AT19))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|)) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) ((_ extract 0 0) N25__AT19))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT19 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))))))
(assert (= sb.mpt.ff_cnt.en__AT19 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT19) ((_ extract 0 0) N25__AT19)) rst__AT19) sb.ff_en.Q__AT19))))
(assert (= sb.mpt.ff_cnt.D__AT19 ((_ zero_extend 0) (ite (= rst__AT19 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) #b0000)) ((_ extract 0 0) N25__AT19))))))))
(assert (= sb.ff_magic_packet.en__AT19 ((_ zero_extend 0) (bvand (bvand start__AT19 ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))))
(assert (= sb.ff_en.en__AT19 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT19))))
(assert (= sb.ff_en.D__AT19 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT19 (bvand start__AT19 ((_ extract 0 0) push__AT19))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT19 #b00)) (bvnot (bvnot (bvcomp N25__AT19 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT19 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT19 reqs__AT19)) ((_ extract 1 1) (bvand N25__AT19 reqs__AT19))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT19 #b00))) (bvand (bvnot (bvcomp N25__AT19 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT19) (bvsub ((_ zero_extend 30) N25__AT19) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT19 ((_ zero_extend 0) N25__AT19)))
(assert (= data_out_vld__AT19 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT19 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT19 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) #b0000)) ((_ extract 0 0) N25__AT19))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT19| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|)) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) ((_ extract 0 0) N25__AT19))))))))))))
(assert (= af.gnt__AT19 ((_ zero_extend 0) N25__AT19)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT19| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT19| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|)))
(assert (= full__AT19 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|)))))))
(assert (= |af.gen_fifos[1].f.full__AT19| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT19| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT19| (concat #b000 ((_ extract 1 1) push__AT19))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT19| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT19| (concat #b000 ((_ extract 1 1) N25__AT19))))))
(assert (= empty__AT19 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT19| |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT19| |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|))))
(assert (= |af.gen_fifos[1].f.empty__AT19| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT19| |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT19| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT19) ((_ extract 1 1) N25__AT19)) rst__AT19))))
(assert (= data_out__AT19 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|)) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) (concat ((_ extract 1 1) N25__AT19) ((_ extract 1 1) N25__AT19))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|)) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) (concat ((_ extract 0 0) N25__AT19) ((_ extract 0 0) N25__AT19))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT19| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT19| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|)))
(assert (= |af.gen_fifos[0].f.full__AT19| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT19| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| (concat #b000 ((_ extract 0 0) push__AT19))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT19| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT19| (concat #b000 ((_ extract 0 0) N25__AT19))))))
(assert (= |af.gen_fifos[0].f.empty__AT19| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT19| |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT19| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT19) ((_ extract 0 0) N25__AT19)) rst__AT19))))
(assert (= |af.fifo_data_out[1]__AT19| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|)))))
(assert (= |af.fifo_data_out[0]__AT19| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|)))))
(assert (= rst__AT19 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT19 (ite (= rst__AT18 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT18) ((_ extract 0 0) N25__AT18)) rst__AT18) sb.ff_en.Q__AT18) #b1) (ite (= rst__AT18 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT18 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT18 #b1000)) ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)))) #b0000)) ((_ extract 0 0) N25__AT18))))) sb.mpt.ff_cnt.Q__AT18))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT19| (ite (= rst__AT18 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT18) ((_ extract 0 0) N25__AT18)) rst__AT18) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT18| (concat #b000 ((_ extract 0 0) N25__AT18))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT18|))))
(assert (= sb.ff_en.Q__AT19 (ite (= rst__AT18 #b1) #b0 (ite (= sb.ff_en.Q__AT18 #b1) #b1 (bvor sb.ff_en.Q__AT18 (bvand start__AT18 ((_ extract 0 0) push__AT18)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| (ite (= rst__AT18 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT18) ((_ extract 0 0) N25__AT18)) rst__AT18) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| (concat #b000 ((_ extract 0 0) push__AT18))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT19| (ite (= rst__AT18 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT18) ((_ extract 1 1) N25__AT18)) rst__AT18) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT18| (concat #b000 ((_ extract 1 1) N25__AT18))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT18|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT19| (ite (= rst__AT18 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT18) ((_ extract 1 1) N25__AT18)) rst__AT18) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT18| (concat #b000 ((_ extract 1 1) push__AT18))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|))))
(assert (= |af.gen_fifos[1].f.entries__AT19| (store |af.gen_fifos[1].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|) (bvor (bvand (concat ((_ extract 1 1) push__AT18) (concat ((_ extract 1 1) push__AT18) (concat ((_ extract 1 1) push__AT18) (concat ((_ extract 1 1) push__AT18) (concat ((_ extract 1 1) push__AT18) (concat ((_ extract 1 1) push__AT18) (concat ((_ extract 1 1) push__AT18) ((_ extract 1 1) push__AT18)))))))) ((_ extract 15 8) flat_data_in__AT18)) (bvand (concat (bvnot ((_ extract 1 1) push__AT18)) (concat (bvnot ((_ extract 1 1) push__AT18)) (concat (bvnot ((_ extract 1 1) push__AT18)) (concat (bvnot ((_ extract 1 1) push__AT18)) (concat (bvnot ((_ extract 1 1) push__AT18)) (concat (bvnot ((_ extract 1 1) push__AT18)) (concat (bvnot ((_ extract 1 1) push__AT18)) (bvnot ((_ extract 1 1) push__AT18))))))))) (select |af.gen_fifos[1].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT18|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT19| (store |af.gen_fifos[0].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|) (bvor (bvand (concat ((_ extract 0 0) push__AT18) (concat ((_ extract 0 0) push__AT18) (concat ((_ extract 0 0) push__AT18) (concat ((_ extract 0 0) push__AT18) (concat ((_ extract 0 0) push__AT18) (concat ((_ extract 0 0) push__AT18) (concat ((_ extract 0 0) push__AT18) ((_ extract 0 0) push__AT18)))))))) ((_ extract 7 0) flat_data_in__AT18)) (bvand (concat (bvnot ((_ extract 0 0) push__AT18)) (concat (bvnot ((_ extract 0 0) push__AT18)) (concat (bvnot ((_ extract 0 0) push__AT18)) (concat (bvnot ((_ extract 0 0) push__AT18)) (concat (bvnot ((_ extract 0 0) push__AT18)) (concat (bvnot ((_ extract 0 0) push__AT18)) (concat (bvnot ((_ extract 0 0) push__AT18)) (bvnot ((_ extract 0 0) push__AT18))))))))) (select |af.gen_fifos[0].f.entries__AT18| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT18|)))))))
(assert (= sb.ff_magic_packet.Q__AT19 (ite (= rst__AT18 #b1) #b00000000 (ite (= (bvand (bvand start__AT18 ((_ extract 0 0) push__AT18)) (bvnot sb.ff_en.Q__AT18)) #b1) ((_ extract 7 0) flat_data_in__AT18) sb.ff_magic_packet.Q__AT18))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT19 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop19 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en2_prop19 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en3_prop19 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en4_prop19 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en5_prop19 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en6_prop19 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en7_prop19 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en8_prop19 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en9_prop19 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en10_prop19 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en11_prop19 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en12_prop19 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en13_prop19 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en14_prop19 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en15_prop19 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en16_prop19 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en17_prop19 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en18_prop19 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(define-fun en19_prop19 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT19 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))

(check-sat-assuming ((not (and en1_prop19 en2_prop19 en3_prop19 en4_prop19 en5_prop19 en6_prop19 en7_prop19 en8_prop19 en9_prop19 en10_prop19 en11_prop19 en12_prop19 en13_prop19 en14_prop19 en15_prop19 en16_prop19 en17_prop19 en18_prop19 en19_prop19))))



(echo "Checking property at bound 19")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT20| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT20| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT20| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT20| () (_ BitVec 4))
(declare-fun prop_signal__AT20 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT20| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT20 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT20| () (_ BitVec 1))
(declare-fun flat_data_in__AT19 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT20| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT20 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT20| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT20 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT20| () (_ BitVec 8))
(declare-fun start__AT20 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT20 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT20| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.en__AT20 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT20 () (_ BitVec 1))
(declare-fun data_out__AT20 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.entries__AT20| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT20 () (_ BitVec 8))
(declare-fun push__AT20 () (_ BitVec 2))
(declare-fun pop__AT20 () (_ BitVec 2))
(declare-fun full__AT20 () (_ BitVec 2))
(declare-fun data_out_vld__AT20 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT20| () (_ BitVec 8))
(declare-fun af.gnt__AT20 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT20| () (_ BitVec 4))
(declare-fun reqs__AT20 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT20| () (_ BitVec 4))
(declare-fun empty__AT20 () (_ BitVec 2))
(declare-fun N25__AT20 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT20| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT20| () (_ BitVec 4))
(declare-fun rst__AT20 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT20| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT20 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT20| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT20| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT20| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT20 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT20| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT20| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT20)) (bvnot ((_ extract 1 1) push__AT20))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT20)) (bvnot ((_ extract 0 0) push__AT20))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT20)) (bvnot ((_ extract 0 0) reqs__AT20))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT20)) (bvnot ((_ extract 1 1) reqs__AT20))) #b1))
(assert true)
(assert (= prop_signal__AT20 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT20 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT20 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) #b0000)) ((_ extract 0 0) N25__AT20))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT20 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|)) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) ((_ extract 1 1) N25__AT20))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|)) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) ((_ extract 0 0) N25__AT20))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT20 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))))))
(assert (= sb.mpt.ff_cnt.en__AT20 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT20) ((_ extract 0 0) N25__AT20)) rst__AT20) sb.ff_en.Q__AT20))))
(assert (= sb.mpt.ff_cnt.D__AT20 ((_ zero_extend 0) (ite (= rst__AT20 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) #b0000)) ((_ extract 0 0) N25__AT20))))))))
(assert (= sb.ff_magic_packet.en__AT20 ((_ zero_extend 0) (bvand (bvand start__AT20 ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))))
(assert (= sb.ff_en.en__AT20 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT20))))
(assert (= sb.ff_en.D__AT20 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT20 (bvand start__AT20 ((_ extract 0 0) push__AT20))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT20 #b00)) (bvnot (bvnot (bvcomp N25__AT20 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT20 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT20 reqs__AT20)) ((_ extract 1 1) (bvand N25__AT20 reqs__AT20))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT20 #b00))) (bvand (bvnot (bvcomp N25__AT20 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT20) (bvsub ((_ zero_extend 30) N25__AT20) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT20 ((_ zero_extend 0) N25__AT20)))
(assert (= data_out_vld__AT20 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT20 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT20 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) #b0000)) ((_ extract 0 0) N25__AT20))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT20| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|)) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) ((_ extract 0 0) N25__AT20))))))))))))
(assert (= af.gnt__AT20 ((_ zero_extend 0) N25__AT20)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT20| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT20| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|)))
(assert (= full__AT20 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|)))))))
(assert (= |af.gen_fifos[1].f.full__AT20| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT20| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT20| (concat #b000 ((_ extract 1 1) push__AT20))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT20| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT20| (concat #b000 ((_ extract 1 1) N25__AT20))))))
(assert (= empty__AT20 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT20| |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT20| |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|))))
(assert (= |af.gen_fifos[1].f.empty__AT20| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT20| |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT20| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT20) ((_ extract 1 1) N25__AT20)) rst__AT20))))
(assert (= data_out__AT20 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|)) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) (concat ((_ extract 1 1) N25__AT20) ((_ extract 1 1) N25__AT20))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|)) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) (concat ((_ extract 0 0) N25__AT20) ((_ extract 0 0) N25__AT20))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT20| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT20| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|)))
(assert (= |af.gen_fifos[0].f.full__AT20| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT20| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| (concat #b000 ((_ extract 0 0) push__AT20))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT20| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT20| (concat #b000 ((_ extract 0 0) N25__AT20))))))
(assert (= |af.gen_fifos[0].f.empty__AT20| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT20| |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT20| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT20) ((_ extract 0 0) N25__AT20)) rst__AT20))))
(assert (= |af.fifo_data_out[1]__AT20| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|)))))
(assert (= |af.fifo_data_out[0]__AT20| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|)))))
(assert (= rst__AT20 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT20 (ite (= rst__AT19 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT19) ((_ extract 0 0) N25__AT19)) rst__AT19) sb.ff_en.Q__AT19) #b1) (ite (= rst__AT19 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT19 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT19 #b1000)) ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)))) #b0000)) ((_ extract 0 0) N25__AT19))))) sb.mpt.ff_cnt.Q__AT19))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT20| (ite (= rst__AT19 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT19) ((_ extract 0 0) N25__AT19)) rst__AT19) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT19| (concat #b000 ((_ extract 0 0) N25__AT19))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT19|))))
(assert (= sb.ff_en.Q__AT20 (ite (= rst__AT19 #b1) #b0 (ite (= sb.ff_en.Q__AT19 #b1) #b1 (bvor sb.ff_en.Q__AT19 (bvand start__AT19 ((_ extract 0 0) push__AT19)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| (ite (= rst__AT19 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT19) ((_ extract 0 0) N25__AT19)) rst__AT19) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| (concat #b000 ((_ extract 0 0) push__AT19))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT20| (ite (= rst__AT19 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT19) ((_ extract 1 1) N25__AT19)) rst__AT19) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT19| (concat #b000 ((_ extract 1 1) N25__AT19))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT19|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT20| (ite (= rst__AT19 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT19) ((_ extract 1 1) N25__AT19)) rst__AT19) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT19| (concat #b000 ((_ extract 1 1) push__AT19))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|))))
(assert (= |af.gen_fifos[1].f.entries__AT20| (store |af.gen_fifos[1].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|) (bvor (bvand (concat ((_ extract 1 1) push__AT19) (concat ((_ extract 1 1) push__AT19) (concat ((_ extract 1 1) push__AT19) (concat ((_ extract 1 1) push__AT19) (concat ((_ extract 1 1) push__AT19) (concat ((_ extract 1 1) push__AT19) (concat ((_ extract 1 1) push__AT19) ((_ extract 1 1) push__AT19)))))))) ((_ extract 15 8) flat_data_in__AT19)) (bvand (concat (bvnot ((_ extract 1 1) push__AT19)) (concat (bvnot ((_ extract 1 1) push__AT19)) (concat (bvnot ((_ extract 1 1) push__AT19)) (concat (bvnot ((_ extract 1 1) push__AT19)) (concat (bvnot ((_ extract 1 1) push__AT19)) (concat (bvnot ((_ extract 1 1) push__AT19)) (concat (bvnot ((_ extract 1 1) push__AT19)) (bvnot ((_ extract 1 1) push__AT19))))))))) (select |af.gen_fifos[1].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT19|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT20| (store |af.gen_fifos[0].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|) (bvor (bvand (concat ((_ extract 0 0) push__AT19) (concat ((_ extract 0 0) push__AT19) (concat ((_ extract 0 0) push__AT19) (concat ((_ extract 0 0) push__AT19) (concat ((_ extract 0 0) push__AT19) (concat ((_ extract 0 0) push__AT19) (concat ((_ extract 0 0) push__AT19) ((_ extract 0 0) push__AT19)))))))) ((_ extract 7 0) flat_data_in__AT19)) (bvand (concat (bvnot ((_ extract 0 0) push__AT19)) (concat (bvnot ((_ extract 0 0) push__AT19)) (concat (bvnot ((_ extract 0 0) push__AT19)) (concat (bvnot ((_ extract 0 0) push__AT19)) (concat (bvnot ((_ extract 0 0) push__AT19)) (concat (bvnot ((_ extract 0 0) push__AT19)) (concat (bvnot ((_ extract 0 0) push__AT19)) (bvnot ((_ extract 0 0) push__AT19))))))))) (select |af.gen_fifos[0].f.entries__AT19| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT19|)))))))
(assert (= sb.ff_magic_packet.Q__AT20 (ite (= rst__AT19 #b1) #b00000000 (ite (= (bvand (bvand start__AT19 ((_ extract 0 0) push__AT19)) (bvnot sb.ff_en.Q__AT19)) #b1) ((_ extract 7 0) flat_data_in__AT19) sb.ff_magic_packet.Q__AT19))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT20 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop20 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en2_prop20 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en3_prop20 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en4_prop20 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en5_prop20 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en6_prop20 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en7_prop20 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en8_prop20 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en9_prop20 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en10_prop20 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en11_prop20 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en12_prop20 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en13_prop20 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en14_prop20 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en15_prop20 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en16_prop20 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en17_prop20 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en18_prop20 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en19_prop20 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(define-fun en20_prop20 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT20 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))

(check-sat-assuming ((not (and en1_prop20 en2_prop20 en3_prop20 en4_prop20 en5_prop20 en6_prop20 en7_prop20 en8_prop20 en9_prop20 en10_prop20 en11_prop20 en12_prop20 en13_prop20 en14_prop20 en15_prop20 en16_prop20 en17_prop20 en18_prop20 en19_prop20 en20_prop20))))



(echo "Checking property at bound 20")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.wrPtr__AT21| () (_ BitVec 4))
(declare-fun reqs__AT21 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT21| () (_ BitVec 4))
(declare-fun empty__AT21 () (_ BitVec 2))
(declare-fun N25__AT21 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT21| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT21| () (_ BitVec 4))
(declare-fun rst__AT21 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT21| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT21 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT21| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT21| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT21| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT21 () (_ BitVec 1))
(declare-fun data_out__AT21 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT21| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT21| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT21| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT21| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT21| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT21| () (_ BitVec 4))
(declare-fun prop_signal__AT21 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT21| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT21 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT21| () (_ BitVec 1))
(declare-fun flat_data_in__AT20 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT21| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT21 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT21| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT21 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT21| () (_ BitVec 8))
(declare-fun start__AT21 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT21| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT21 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT21 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT21 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT21| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT21 () (_ BitVec 8))
(declare-fun push__AT21 () (_ BitVec 2))
(declare-fun pop__AT21 () (_ BitVec 2))
(declare-fun full__AT21 () (_ BitVec 2))
(declare-fun data_out_vld__AT21 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT21| () (_ BitVec 8))
(declare-fun af.gnt__AT21 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT21)) (bvnot ((_ extract 1 1) push__AT21))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT21)) (bvnot ((_ extract 0 0) push__AT21))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT21)) (bvnot ((_ extract 0 0) reqs__AT21))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT21)) (bvnot ((_ extract 1 1) reqs__AT21))) #b1))
(assert true)
(assert (= prop_signal__AT21 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT21 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT21 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) #b0000)) ((_ extract 0 0) N25__AT21))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT21 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|)) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) ((_ extract 1 1) N25__AT21))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|)) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) ((_ extract 0 0) N25__AT21))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT21 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))))))
(assert (= sb.mpt.ff_cnt.en__AT21 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT21) ((_ extract 0 0) N25__AT21)) rst__AT21) sb.ff_en.Q__AT21))))
(assert (= sb.mpt.ff_cnt.D__AT21 ((_ zero_extend 0) (ite (= rst__AT21 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) #b0000)) ((_ extract 0 0) N25__AT21))))))))
(assert (= sb.ff_magic_packet.en__AT21 ((_ zero_extend 0) (bvand (bvand start__AT21 ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))))
(assert (= sb.ff_en.en__AT21 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT21))))
(assert (= sb.ff_en.D__AT21 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT21 (bvand start__AT21 ((_ extract 0 0) push__AT21))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT21 #b00)) (bvnot (bvnot (bvcomp N25__AT21 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT21 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT21 reqs__AT21)) ((_ extract 1 1) (bvand N25__AT21 reqs__AT21))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT21 #b00))) (bvand (bvnot (bvcomp N25__AT21 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT21) (bvsub ((_ zero_extend 30) N25__AT21) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT21 ((_ zero_extend 0) N25__AT21)))
(assert (= data_out_vld__AT21 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT21 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT21 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) #b0000)) ((_ extract 0 0) N25__AT21))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT21| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|)) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) ((_ extract 0 0) N25__AT21))))))))))))
(assert (= af.gnt__AT21 ((_ zero_extend 0) N25__AT21)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT21| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT21| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|)))
(assert (= full__AT21 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|)))))))
(assert (= |af.gen_fifos[1].f.full__AT21| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT21| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT21| (concat #b000 ((_ extract 1 1) push__AT21))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT21| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT21| (concat #b000 ((_ extract 1 1) N25__AT21))))))
(assert (= empty__AT21 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT21| |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT21| |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|))))
(assert (= |af.gen_fifos[1].f.empty__AT21| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT21| |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT21| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT21) ((_ extract 1 1) N25__AT21)) rst__AT21))))
(assert (= data_out__AT21 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|)) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) (concat ((_ extract 1 1) N25__AT21) ((_ extract 1 1) N25__AT21))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|)) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) (concat ((_ extract 0 0) N25__AT21) ((_ extract 0 0) N25__AT21))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT21| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT21| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|)))
(assert (= |af.gen_fifos[0].f.full__AT21| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT21| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| (concat #b000 ((_ extract 0 0) push__AT21))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT21| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT21| (concat #b000 ((_ extract 0 0) N25__AT21))))))
(assert (= |af.gen_fifos[0].f.empty__AT21| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT21| |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT21| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT21) ((_ extract 0 0) N25__AT21)) rst__AT21))))
(assert (= |af.fifo_data_out[1]__AT21| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|)))))
(assert (= |af.fifo_data_out[0]__AT21| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|)))))
(assert (= rst__AT21 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT21 (ite (= rst__AT20 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT20) ((_ extract 0 0) N25__AT20)) rst__AT20) sb.ff_en.Q__AT20) #b1) (ite (= rst__AT20 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT20 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT20 #b1000)) ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)))) #b0000)) ((_ extract 0 0) N25__AT20))))) sb.mpt.ff_cnt.Q__AT20))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT21| (ite (= rst__AT20 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT20) ((_ extract 0 0) N25__AT20)) rst__AT20) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT20| (concat #b000 ((_ extract 0 0) N25__AT20))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT20|))))
(assert (= sb.ff_en.Q__AT21 (ite (= rst__AT20 #b1) #b0 (ite (= sb.ff_en.Q__AT20 #b1) #b1 (bvor sb.ff_en.Q__AT20 (bvand start__AT20 ((_ extract 0 0) push__AT20)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| (ite (= rst__AT20 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT20) ((_ extract 0 0) N25__AT20)) rst__AT20) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| (concat #b000 ((_ extract 0 0) push__AT20))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT21| (ite (= rst__AT20 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT20) ((_ extract 1 1) N25__AT20)) rst__AT20) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT20| (concat #b000 ((_ extract 1 1) N25__AT20))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT20|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT21| (ite (= rst__AT20 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT20) ((_ extract 1 1) N25__AT20)) rst__AT20) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT20| (concat #b000 ((_ extract 1 1) push__AT20))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|))))
(assert (= |af.gen_fifos[1].f.entries__AT21| (store |af.gen_fifos[1].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|) (bvor (bvand (concat ((_ extract 1 1) push__AT20) (concat ((_ extract 1 1) push__AT20) (concat ((_ extract 1 1) push__AT20) (concat ((_ extract 1 1) push__AT20) (concat ((_ extract 1 1) push__AT20) (concat ((_ extract 1 1) push__AT20) (concat ((_ extract 1 1) push__AT20) ((_ extract 1 1) push__AT20)))))))) ((_ extract 15 8) flat_data_in__AT20)) (bvand (concat (bvnot ((_ extract 1 1) push__AT20)) (concat (bvnot ((_ extract 1 1) push__AT20)) (concat (bvnot ((_ extract 1 1) push__AT20)) (concat (bvnot ((_ extract 1 1) push__AT20)) (concat (bvnot ((_ extract 1 1) push__AT20)) (concat (bvnot ((_ extract 1 1) push__AT20)) (concat (bvnot ((_ extract 1 1) push__AT20)) (bvnot ((_ extract 1 1) push__AT20))))))))) (select |af.gen_fifos[1].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT20|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT21| (store |af.gen_fifos[0].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|) (bvor (bvand (concat ((_ extract 0 0) push__AT20) (concat ((_ extract 0 0) push__AT20) (concat ((_ extract 0 0) push__AT20) (concat ((_ extract 0 0) push__AT20) (concat ((_ extract 0 0) push__AT20) (concat ((_ extract 0 0) push__AT20) (concat ((_ extract 0 0) push__AT20) ((_ extract 0 0) push__AT20)))))))) ((_ extract 7 0) flat_data_in__AT20)) (bvand (concat (bvnot ((_ extract 0 0) push__AT20)) (concat (bvnot ((_ extract 0 0) push__AT20)) (concat (bvnot ((_ extract 0 0) push__AT20)) (concat (bvnot ((_ extract 0 0) push__AT20)) (concat (bvnot ((_ extract 0 0) push__AT20)) (concat (bvnot ((_ extract 0 0) push__AT20)) (concat (bvnot ((_ extract 0 0) push__AT20)) (bvnot ((_ extract 0 0) push__AT20))))))))) (select |af.gen_fifos[0].f.entries__AT20| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT20|)))))))
(assert (= sb.ff_magic_packet.Q__AT21 (ite (= rst__AT20 #b1) #b00000000 (ite (= (bvand (bvand start__AT20 ((_ extract 0 0) push__AT20)) (bvnot sb.ff_en.Q__AT20)) #b1) ((_ extract 7 0) flat_data_in__AT20) sb.ff_magic_packet.Q__AT20))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT21 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop21 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en2_prop21 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en3_prop21 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en4_prop21 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en5_prop21 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en6_prop21 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en7_prop21 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en8_prop21 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en9_prop21 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en10_prop21 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en11_prop21 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en12_prop21 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en13_prop21 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en14_prop21 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en15_prop21 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en16_prop21 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en17_prop21 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en18_prop21 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en19_prop21 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en20_prop21 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(define-fun en21_prop21 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT21 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))

(check-sat-assuming ((not (and en1_prop21 en2_prop21 en3_prop21 en4_prop21 en5_prop21 en6_prop21 en7_prop21 en8_prop21 en9_prop21 en10_prop21 en11_prop21 en12_prop21 en13_prop21 en14_prop21 en15_prop21 en16_prop21 en17_prop21 en18_prop21 en19_prop21 en20_prop21 en21_prop21))))



(echo "Checking property at bound 21")

(check-sat)

(pop 1)
(declare-fun flat_data_in__AT21 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT22| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT22 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT22| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT22 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT22| () (_ BitVec 8))
(declare-fun start__AT22 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT22| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT22 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT22 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT22 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT22| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT22 () (_ BitVec 8))
(declare-fun push__AT22 () (_ BitVec 2))
(declare-fun pop__AT22 () (_ BitVec 2))
(declare-fun full__AT22 () (_ BitVec 2))
(declare-fun data_out_vld__AT22 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT22| () (_ BitVec 8))
(declare-fun af.gnt__AT22 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT22| () (_ BitVec 4))
(declare-fun reqs__AT22 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT22| () (_ BitVec 4))
(declare-fun empty__AT22 () (_ BitVec 2))
(declare-fun N25__AT22 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT22| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT22| () (_ BitVec 4))
(declare-fun rst__AT22 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT22| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT22 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT22| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT22| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT22| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT22 () (_ BitVec 1))
(declare-fun data_out__AT22 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT22| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT22| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT22| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT22| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT22| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT22| () (_ BitVec 4))
(declare-fun prop_signal__AT22 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT22| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT22 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT22| () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT22)) (bvnot ((_ extract 1 1) push__AT22))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT22)) (bvnot ((_ extract 0 0) push__AT22))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT22)) (bvnot ((_ extract 0 0) reqs__AT22))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT22)) (bvnot ((_ extract 1 1) reqs__AT22))) #b1))
(assert true)
(assert (= prop_signal__AT22 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT22 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT22 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) #b0000)) ((_ extract 0 0) N25__AT22))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT22 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|)) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) ((_ extract 1 1) N25__AT22))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|)) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) ((_ extract 0 0) N25__AT22))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT22 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))))))
(assert (= sb.mpt.ff_cnt.en__AT22 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT22) ((_ extract 0 0) N25__AT22)) rst__AT22) sb.ff_en.Q__AT22))))
(assert (= sb.mpt.ff_cnt.D__AT22 ((_ zero_extend 0) (ite (= rst__AT22 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) #b0000)) ((_ extract 0 0) N25__AT22))))))))
(assert (= sb.ff_magic_packet.en__AT22 ((_ zero_extend 0) (bvand (bvand start__AT22 ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))))
(assert (= sb.ff_en.en__AT22 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT22))))
(assert (= sb.ff_en.D__AT22 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT22 (bvand start__AT22 ((_ extract 0 0) push__AT22))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT22 #b00)) (bvnot (bvnot (bvcomp N25__AT22 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT22 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT22 reqs__AT22)) ((_ extract 1 1) (bvand N25__AT22 reqs__AT22))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT22 #b00))) (bvand (bvnot (bvcomp N25__AT22 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT22) (bvsub ((_ zero_extend 30) N25__AT22) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT22 ((_ zero_extend 0) N25__AT22)))
(assert (= data_out_vld__AT22 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT22 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT22 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) #b0000)) ((_ extract 0 0) N25__AT22))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT22| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|)) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) ((_ extract 0 0) N25__AT22))))))))))))
(assert (= af.gnt__AT22 ((_ zero_extend 0) N25__AT22)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT22| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT22| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|)))
(assert (= full__AT22 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|)))))))
(assert (= |af.gen_fifos[1].f.full__AT22| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT22| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT22| (concat #b000 ((_ extract 1 1) push__AT22))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT22| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT22| (concat #b000 ((_ extract 1 1) N25__AT22))))))
(assert (= empty__AT22 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT22| |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT22| |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|))))
(assert (= |af.gen_fifos[1].f.empty__AT22| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT22| |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT22| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT22) ((_ extract 1 1) N25__AT22)) rst__AT22))))
(assert (= data_out__AT22 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|)) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) (concat ((_ extract 1 1) N25__AT22) ((_ extract 1 1) N25__AT22))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|)) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) (concat ((_ extract 0 0) N25__AT22) ((_ extract 0 0) N25__AT22))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT22| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT22| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|)))
(assert (= |af.gen_fifos[0].f.full__AT22| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT22| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| (concat #b000 ((_ extract 0 0) push__AT22))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT22| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT22| (concat #b000 ((_ extract 0 0) N25__AT22))))))
(assert (= |af.gen_fifos[0].f.empty__AT22| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT22| |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT22| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT22) ((_ extract 0 0) N25__AT22)) rst__AT22))))
(assert (= |af.fifo_data_out[1]__AT22| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|)))))
(assert (= |af.fifo_data_out[0]__AT22| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|)))))
(assert (= rst__AT22 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT22 (ite (= rst__AT21 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT21) ((_ extract 0 0) N25__AT21)) rst__AT21) sb.ff_en.Q__AT21) #b1) (ite (= rst__AT21 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT21 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT21 #b1000)) ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)))) #b0000)) ((_ extract 0 0) N25__AT21))))) sb.mpt.ff_cnt.Q__AT21))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT22| (ite (= rst__AT21 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT21) ((_ extract 0 0) N25__AT21)) rst__AT21) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT21| (concat #b000 ((_ extract 0 0) N25__AT21))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT21|))))
(assert (= sb.ff_en.Q__AT22 (ite (= rst__AT21 #b1) #b0 (ite (= sb.ff_en.Q__AT21 #b1) #b1 (bvor sb.ff_en.Q__AT21 (bvand start__AT21 ((_ extract 0 0) push__AT21)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| (ite (= rst__AT21 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT21) ((_ extract 0 0) N25__AT21)) rst__AT21) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| (concat #b000 ((_ extract 0 0) push__AT21))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT22| (ite (= rst__AT21 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT21) ((_ extract 1 1) N25__AT21)) rst__AT21) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT21| (concat #b000 ((_ extract 1 1) N25__AT21))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT21|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT22| (ite (= rst__AT21 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT21) ((_ extract 1 1) N25__AT21)) rst__AT21) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT21| (concat #b000 ((_ extract 1 1) push__AT21))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|))))
(assert (= |af.gen_fifos[1].f.entries__AT22| (store |af.gen_fifos[1].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|) (bvor (bvand (concat ((_ extract 1 1) push__AT21) (concat ((_ extract 1 1) push__AT21) (concat ((_ extract 1 1) push__AT21) (concat ((_ extract 1 1) push__AT21) (concat ((_ extract 1 1) push__AT21) (concat ((_ extract 1 1) push__AT21) (concat ((_ extract 1 1) push__AT21) ((_ extract 1 1) push__AT21)))))))) ((_ extract 15 8) flat_data_in__AT21)) (bvand (concat (bvnot ((_ extract 1 1) push__AT21)) (concat (bvnot ((_ extract 1 1) push__AT21)) (concat (bvnot ((_ extract 1 1) push__AT21)) (concat (bvnot ((_ extract 1 1) push__AT21)) (concat (bvnot ((_ extract 1 1) push__AT21)) (concat (bvnot ((_ extract 1 1) push__AT21)) (concat (bvnot ((_ extract 1 1) push__AT21)) (bvnot ((_ extract 1 1) push__AT21))))))))) (select |af.gen_fifos[1].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT21|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT22| (store |af.gen_fifos[0].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|) (bvor (bvand (concat ((_ extract 0 0) push__AT21) (concat ((_ extract 0 0) push__AT21) (concat ((_ extract 0 0) push__AT21) (concat ((_ extract 0 0) push__AT21) (concat ((_ extract 0 0) push__AT21) (concat ((_ extract 0 0) push__AT21) (concat ((_ extract 0 0) push__AT21) ((_ extract 0 0) push__AT21)))))))) ((_ extract 7 0) flat_data_in__AT21)) (bvand (concat (bvnot ((_ extract 0 0) push__AT21)) (concat (bvnot ((_ extract 0 0) push__AT21)) (concat (bvnot ((_ extract 0 0) push__AT21)) (concat (bvnot ((_ extract 0 0) push__AT21)) (concat (bvnot ((_ extract 0 0) push__AT21)) (concat (bvnot ((_ extract 0 0) push__AT21)) (concat (bvnot ((_ extract 0 0) push__AT21)) (bvnot ((_ extract 0 0) push__AT21))))))))) (select |af.gen_fifos[0].f.entries__AT21| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT21|)))))))
(assert (= sb.ff_magic_packet.Q__AT22 (ite (= rst__AT21 #b1) #b00000000 (ite (= (bvand (bvand start__AT21 ((_ extract 0 0) push__AT21)) (bvnot sb.ff_en.Q__AT21)) #b1) ((_ extract 7 0) flat_data_in__AT21) sb.ff_magic_packet.Q__AT21))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT22 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop22 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en2_prop22 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en3_prop22 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en4_prop22 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en5_prop22 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en6_prop22 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en7_prop22 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en8_prop22 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en9_prop22 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en10_prop22 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en11_prop22 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en12_prop22 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en13_prop22 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en14_prop22 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en15_prop22 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en16_prop22 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en17_prop22 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en18_prop22 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en19_prop22 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en20_prop22 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en21_prop22 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(define-fun en22_prop22 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT22 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))

(check-sat-assuming ((not (and en1_prop22 en2_prop22 en3_prop22 en4_prop22 en5_prop22 en6_prop22 en7_prop22 en8_prop22 en9_prop22 en10_prop22 en11_prop22 en12_prop22 en13_prop22 en14_prop22 en15_prop22 en16_prop22 en17_prop22 en18_prop22 en19_prop22 en20_prop22 en21_prop22 en22_prop22))))



(echo "Checking property at bound 22")

(check-sat)

(pop 1)
(declare-fun N25__AT23 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT23| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT23| () (_ BitVec 4))
(declare-fun rst__AT23 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT23| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT23 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT23| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT23| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT23| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT23 () (_ BitVec 1))
(declare-fun data_out__AT23 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT23| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT23| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT23| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT23| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT23| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT23| () (_ BitVec 4))
(declare-fun prop_signal__AT23 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT23| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT23 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT23| () (_ BitVec 1))
(declare-fun flat_data_in__AT22 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT23| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT23 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT23| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT23 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT23| () (_ BitVec 8))
(declare-fun start__AT23 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT23| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT23 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT23 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT23 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT23| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT23 () (_ BitVec 8))
(declare-fun push__AT23 () (_ BitVec 2))
(declare-fun pop__AT23 () (_ BitVec 2))
(declare-fun full__AT23 () (_ BitVec 2))
(declare-fun data_out_vld__AT23 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT23| () (_ BitVec 8))
(declare-fun af.gnt__AT23 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT23| () (_ BitVec 4))
(declare-fun reqs__AT23 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT23| () (_ BitVec 4))
(declare-fun empty__AT23 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT23)) (bvnot ((_ extract 1 1) push__AT23))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT23)) (bvnot ((_ extract 0 0) push__AT23))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT23)) (bvnot ((_ extract 0 0) reqs__AT23))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT23)) (bvnot ((_ extract 1 1) reqs__AT23))) #b1))
(assert true)
(assert (= prop_signal__AT23 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT23 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT23 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) #b0000)) ((_ extract 0 0) N25__AT23))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT23 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|)) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) ((_ extract 1 1) N25__AT23))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|)) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) ((_ extract 0 0) N25__AT23))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT23 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))))))
(assert (= sb.mpt.ff_cnt.en__AT23 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT23) ((_ extract 0 0) N25__AT23)) rst__AT23) sb.ff_en.Q__AT23))))
(assert (= sb.mpt.ff_cnt.D__AT23 ((_ zero_extend 0) (ite (= rst__AT23 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) #b0000)) ((_ extract 0 0) N25__AT23))))))))
(assert (= sb.ff_magic_packet.en__AT23 ((_ zero_extend 0) (bvand (bvand start__AT23 ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))))
(assert (= sb.ff_en.en__AT23 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT23))))
(assert (= sb.ff_en.D__AT23 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT23 (bvand start__AT23 ((_ extract 0 0) push__AT23))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT23 #b00)) (bvnot (bvnot (bvcomp N25__AT23 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT23 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT23 reqs__AT23)) ((_ extract 1 1) (bvand N25__AT23 reqs__AT23))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT23 #b00))) (bvand (bvnot (bvcomp N25__AT23 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT23) (bvsub ((_ zero_extend 30) N25__AT23) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT23 ((_ zero_extend 0) N25__AT23)))
(assert (= data_out_vld__AT23 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT23 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT23 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) #b0000)) ((_ extract 0 0) N25__AT23))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT23| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|)) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) ((_ extract 0 0) N25__AT23))))))))))))
(assert (= af.gnt__AT23 ((_ zero_extend 0) N25__AT23)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT23| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT23| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|)))
(assert (= full__AT23 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|)))))))
(assert (= |af.gen_fifos[1].f.full__AT23| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT23| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT23| (concat #b000 ((_ extract 1 1) push__AT23))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT23| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT23| (concat #b000 ((_ extract 1 1) N25__AT23))))))
(assert (= empty__AT23 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT23| |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT23| |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|))))
(assert (= |af.gen_fifos[1].f.empty__AT23| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT23| |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT23| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT23) ((_ extract 1 1) N25__AT23)) rst__AT23))))
(assert (= data_out__AT23 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|)) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) (concat ((_ extract 1 1) N25__AT23) ((_ extract 1 1) N25__AT23))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|)) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) (concat ((_ extract 0 0) N25__AT23) ((_ extract 0 0) N25__AT23))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT23| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT23| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|)))
(assert (= |af.gen_fifos[0].f.full__AT23| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT23| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| (concat #b000 ((_ extract 0 0) push__AT23))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT23| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT23| (concat #b000 ((_ extract 0 0) N25__AT23))))))
(assert (= |af.gen_fifos[0].f.empty__AT23| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT23| |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT23| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT23) ((_ extract 0 0) N25__AT23)) rst__AT23))))
(assert (= |af.fifo_data_out[1]__AT23| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|)))))
(assert (= |af.fifo_data_out[0]__AT23| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|)))))
(assert (= rst__AT23 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT23 (ite (= rst__AT22 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT22) ((_ extract 0 0) N25__AT22)) rst__AT22) sb.ff_en.Q__AT22) #b1) (ite (= rst__AT22 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT22 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT22 #b1000)) ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)))) #b0000)) ((_ extract 0 0) N25__AT22))))) sb.mpt.ff_cnt.Q__AT22))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT23| (ite (= rst__AT22 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT22) ((_ extract 0 0) N25__AT22)) rst__AT22) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT22| (concat #b000 ((_ extract 0 0) N25__AT22))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT22|))))
(assert (= sb.ff_en.Q__AT23 (ite (= rst__AT22 #b1) #b0 (ite (= sb.ff_en.Q__AT22 #b1) #b1 (bvor sb.ff_en.Q__AT22 (bvand start__AT22 ((_ extract 0 0) push__AT22)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| (ite (= rst__AT22 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT22) ((_ extract 0 0) N25__AT22)) rst__AT22) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| (concat #b000 ((_ extract 0 0) push__AT22))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT23| (ite (= rst__AT22 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT22) ((_ extract 1 1) N25__AT22)) rst__AT22) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT22| (concat #b000 ((_ extract 1 1) N25__AT22))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT22|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT23| (ite (= rst__AT22 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT22) ((_ extract 1 1) N25__AT22)) rst__AT22) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT22| (concat #b000 ((_ extract 1 1) push__AT22))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|))))
(assert (= |af.gen_fifos[1].f.entries__AT23| (store |af.gen_fifos[1].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|) (bvor (bvand (concat ((_ extract 1 1) push__AT22) (concat ((_ extract 1 1) push__AT22) (concat ((_ extract 1 1) push__AT22) (concat ((_ extract 1 1) push__AT22) (concat ((_ extract 1 1) push__AT22) (concat ((_ extract 1 1) push__AT22) (concat ((_ extract 1 1) push__AT22) ((_ extract 1 1) push__AT22)))))))) ((_ extract 15 8) flat_data_in__AT22)) (bvand (concat (bvnot ((_ extract 1 1) push__AT22)) (concat (bvnot ((_ extract 1 1) push__AT22)) (concat (bvnot ((_ extract 1 1) push__AT22)) (concat (bvnot ((_ extract 1 1) push__AT22)) (concat (bvnot ((_ extract 1 1) push__AT22)) (concat (bvnot ((_ extract 1 1) push__AT22)) (concat (bvnot ((_ extract 1 1) push__AT22)) (bvnot ((_ extract 1 1) push__AT22))))))))) (select |af.gen_fifos[1].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT22|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT23| (store |af.gen_fifos[0].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|) (bvor (bvand (concat ((_ extract 0 0) push__AT22) (concat ((_ extract 0 0) push__AT22) (concat ((_ extract 0 0) push__AT22) (concat ((_ extract 0 0) push__AT22) (concat ((_ extract 0 0) push__AT22) (concat ((_ extract 0 0) push__AT22) (concat ((_ extract 0 0) push__AT22) ((_ extract 0 0) push__AT22)))))))) ((_ extract 7 0) flat_data_in__AT22)) (bvand (concat (bvnot ((_ extract 0 0) push__AT22)) (concat (bvnot ((_ extract 0 0) push__AT22)) (concat (bvnot ((_ extract 0 0) push__AT22)) (concat (bvnot ((_ extract 0 0) push__AT22)) (concat (bvnot ((_ extract 0 0) push__AT22)) (concat (bvnot ((_ extract 0 0) push__AT22)) (concat (bvnot ((_ extract 0 0) push__AT22)) (bvnot ((_ extract 0 0) push__AT22))))))))) (select |af.gen_fifos[0].f.entries__AT22| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT22|)))))))
(assert (= sb.ff_magic_packet.Q__AT23 (ite (= rst__AT22 #b1) #b00000000 (ite (= (bvand (bvand start__AT22 ((_ extract 0 0) push__AT22)) (bvnot sb.ff_en.Q__AT22)) #b1) ((_ extract 7 0) flat_data_in__AT22) sb.ff_magic_packet.Q__AT22))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT23 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop23 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en2_prop23 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en3_prop23 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en4_prop23 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en5_prop23 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en6_prop23 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en7_prop23 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en8_prop23 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en9_prop23 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en10_prop23 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en11_prop23 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en12_prop23 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en13_prop23 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en14_prop23 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en15_prop23 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en16_prop23 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en17_prop23 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en18_prop23 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en19_prop23 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en20_prop23 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en21_prop23 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en22_prop23 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(define-fun en23_prop23 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT23 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))

(check-sat-assuming ((not (and en1_prop23 en2_prop23 en3_prop23 en4_prop23 en5_prop23 en6_prop23 en7_prop23 en8_prop23 en9_prop23 en10_prop23 en11_prop23 en12_prop23 en13_prop23 en14_prop23 en15_prop23 en16_prop23 en17_prop23 en18_prop23 en19_prop23 en20_prop23 en21_prop23 en22_prop23 en23_prop23))))



(echo "Checking property at bound 23")

(check-sat)

(pop 1)
(declare-fun sb.ff_en.D__AT24 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT24| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT24 () (_ BitVec 8))
(declare-fun push__AT24 () (_ BitVec 2))
(declare-fun pop__AT24 () (_ BitVec 2))
(declare-fun full__AT24 () (_ BitVec 2))
(declare-fun data_out_vld__AT24 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT24| () (_ BitVec 8))
(declare-fun af.gnt__AT24 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT24| () (_ BitVec 4))
(declare-fun reqs__AT24 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT24| () (_ BitVec 4))
(declare-fun empty__AT24 () (_ BitVec 2))
(declare-fun N25__AT24 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT24| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT24| () (_ BitVec 4))
(declare-fun rst__AT24 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT24| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT24 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT24| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT24| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT24| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT24 () (_ BitVec 1))
(declare-fun data_out__AT24 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT24| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT24| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT24| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT24| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT24| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT24| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT24| () (_ BitVec 4))
(declare-fun prop_signal__AT24 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT24| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT24 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT24| () (_ BitVec 1))
(declare-fun flat_data_in__AT23 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT24| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT24 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT24| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT24 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT24| () (_ BitVec 8))
(declare-fun start__AT24 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT24 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT24 () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT24)) (bvnot ((_ extract 1 1) push__AT24))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT24)) (bvnot ((_ extract 0 0) push__AT24))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT24)) (bvnot ((_ extract 0 0) reqs__AT24))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT24)) (bvnot ((_ extract 1 1) reqs__AT24))) #b1))
(assert true)
(assert (= prop_signal__AT24 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT24 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT24 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) #b0000)) ((_ extract 0 0) N25__AT24))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT24 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|)) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) ((_ extract 1 1) N25__AT24))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|)) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) ((_ extract 0 0) N25__AT24))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT24 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))))))
(assert (= sb.mpt.ff_cnt.en__AT24 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT24) ((_ extract 0 0) N25__AT24)) rst__AT24) sb.ff_en.Q__AT24))))
(assert (= sb.mpt.ff_cnt.D__AT24 ((_ zero_extend 0) (ite (= rst__AT24 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) #b0000)) ((_ extract 0 0) N25__AT24))))))))
(assert (= sb.ff_magic_packet.en__AT24 ((_ zero_extend 0) (bvand (bvand start__AT24 ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))))
(assert (= sb.ff_en.en__AT24 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT24))))
(assert (= sb.ff_en.D__AT24 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT24 (bvand start__AT24 ((_ extract 0 0) push__AT24))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT24 #b00)) (bvnot (bvnot (bvcomp N25__AT24 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT24 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT24 reqs__AT24)) ((_ extract 1 1) (bvand N25__AT24 reqs__AT24))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT24 #b00))) (bvand (bvnot (bvcomp N25__AT24 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT24) (bvsub ((_ zero_extend 30) N25__AT24) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT24 ((_ zero_extend 0) N25__AT24)))
(assert (= data_out_vld__AT24 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT24 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT24 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) #b0000)) ((_ extract 0 0) N25__AT24))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT24| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|)) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) ((_ extract 0 0) N25__AT24))))))))))))
(assert (= af.gnt__AT24 ((_ zero_extend 0) N25__AT24)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT24| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT24| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|)))
(assert (= full__AT24 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|)))))))
(assert (= |af.gen_fifos[1].f.full__AT24| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT24| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT24| (concat #b000 ((_ extract 1 1) push__AT24))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT24| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT24| (concat #b000 ((_ extract 1 1) N25__AT24))))))
(assert (= empty__AT24 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT24| |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT24| |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|))))
(assert (= |af.gen_fifos[1].f.empty__AT24| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT24| |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT24| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT24) ((_ extract 1 1) N25__AT24)) rst__AT24))))
(assert (= data_out__AT24 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|)) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) (concat ((_ extract 1 1) N25__AT24) ((_ extract 1 1) N25__AT24))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|)) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) (concat ((_ extract 0 0) N25__AT24) ((_ extract 0 0) N25__AT24))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT24| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT24| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|)))
(assert (= |af.gen_fifos[0].f.full__AT24| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT24| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| (concat #b000 ((_ extract 0 0) push__AT24))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT24| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT24| (concat #b000 ((_ extract 0 0) N25__AT24))))))
(assert (= |af.gen_fifos[0].f.empty__AT24| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT24| |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT24| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT24) ((_ extract 0 0) N25__AT24)) rst__AT24))))
(assert (= |af.fifo_data_out[1]__AT24| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|)))))
(assert (= |af.fifo_data_out[0]__AT24| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|)))))
(assert (= rst__AT24 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT24 (ite (= rst__AT23 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT23) ((_ extract 0 0) N25__AT23)) rst__AT23) sb.ff_en.Q__AT23) #b1) (ite (= rst__AT23 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT23 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT23 #b1000)) ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)))) #b0000)) ((_ extract 0 0) N25__AT23))))) sb.mpt.ff_cnt.Q__AT23))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT24| (ite (= rst__AT23 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT23) ((_ extract 0 0) N25__AT23)) rst__AT23) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT23| (concat #b000 ((_ extract 0 0) N25__AT23))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT23|))))
(assert (= sb.ff_en.Q__AT24 (ite (= rst__AT23 #b1) #b0 (ite (= sb.ff_en.Q__AT23 #b1) #b1 (bvor sb.ff_en.Q__AT23 (bvand start__AT23 ((_ extract 0 0) push__AT23)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| (ite (= rst__AT23 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT23) ((_ extract 0 0) N25__AT23)) rst__AT23) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| (concat #b000 ((_ extract 0 0) push__AT23))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT24| (ite (= rst__AT23 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT23) ((_ extract 1 1) N25__AT23)) rst__AT23) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT23| (concat #b000 ((_ extract 1 1) N25__AT23))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT23|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT24| (ite (= rst__AT23 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT23) ((_ extract 1 1) N25__AT23)) rst__AT23) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT23| (concat #b000 ((_ extract 1 1) push__AT23))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|))))
(assert (= |af.gen_fifos[1].f.entries__AT24| (store |af.gen_fifos[1].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|) (bvor (bvand (concat ((_ extract 1 1) push__AT23) (concat ((_ extract 1 1) push__AT23) (concat ((_ extract 1 1) push__AT23) (concat ((_ extract 1 1) push__AT23) (concat ((_ extract 1 1) push__AT23) (concat ((_ extract 1 1) push__AT23) (concat ((_ extract 1 1) push__AT23) ((_ extract 1 1) push__AT23)))))))) ((_ extract 15 8) flat_data_in__AT23)) (bvand (concat (bvnot ((_ extract 1 1) push__AT23)) (concat (bvnot ((_ extract 1 1) push__AT23)) (concat (bvnot ((_ extract 1 1) push__AT23)) (concat (bvnot ((_ extract 1 1) push__AT23)) (concat (bvnot ((_ extract 1 1) push__AT23)) (concat (bvnot ((_ extract 1 1) push__AT23)) (concat (bvnot ((_ extract 1 1) push__AT23)) (bvnot ((_ extract 1 1) push__AT23))))))))) (select |af.gen_fifos[1].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT23|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT24| (store |af.gen_fifos[0].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|) (bvor (bvand (concat ((_ extract 0 0) push__AT23) (concat ((_ extract 0 0) push__AT23) (concat ((_ extract 0 0) push__AT23) (concat ((_ extract 0 0) push__AT23) (concat ((_ extract 0 0) push__AT23) (concat ((_ extract 0 0) push__AT23) (concat ((_ extract 0 0) push__AT23) ((_ extract 0 0) push__AT23)))))))) ((_ extract 7 0) flat_data_in__AT23)) (bvand (concat (bvnot ((_ extract 0 0) push__AT23)) (concat (bvnot ((_ extract 0 0) push__AT23)) (concat (bvnot ((_ extract 0 0) push__AT23)) (concat (bvnot ((_ extract 0 0) push__AT23)) (concat (bvnot ((_ extract 0 0) push__AT23)) (concat (bvnot ((_ extract 0 0) push__AT23)) (concat (bvnot ((_ extract 0 0) push__AT23)) (bvnot ((_ extract 0 0) push__AT23))))))))) (select |af.gen_fifos[0].f.entries__AT23| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT23|)))))))
(assert (= sb.ff_magic_packet.Q__AT24 (ite (= rst__AT23 #b1) #b00000000 (ite (= (bvand (bvand start__AT23 ((_ extract 0 0) push__AT23)) (bvnot sb.ff_en.Q__AT23)) #b1) ((_ extract 7 0) flat_data_in__AT23) sb.ff_magic_packet.Q__AT23))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT24 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop24 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en2_prop24 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en3_prop24 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en4_prop24 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en5_prop24 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en6_prop24 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en7_prop24 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en8_prop24 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en9_prop24 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en10_prop24 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en11_prop24 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en12_prop24 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en13_prop24 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en14_prop24 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en15_prop24 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en16_prop24 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en17_prop24 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en18_prop24 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en19_prop24 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en20_prop24 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en21_prop24 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en22_prop24 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en23_prop24 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(define-fun en24_prop24 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT24 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))

(check-sat-assuming ((not (and en1_prop24 en2_prop24 en3_prop24 en4_prop24 en5_prop24 en6_prop24 en7_prop24 en8_prop24 en9_prop24 en10_prop24 en11_prop24 en12_prop24 en13_prop24 en14_prop24 en15_prop24 en16_prop24 en17_prop24 en18_prop24 en19_prop24 en20_prop24 en21_prop24 en22_prop24 en23_prop24 en24_prop24))))



(echo "Checking property at bound 24")

(check-sat)

(pop 1)
(declare-fun rst__AT25 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT25| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT25 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT25| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT25| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT25| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT25 () (_ BitVec 1))
(declare-fun data_out__AT25 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT25| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT25| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT25| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT25| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT25| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT25| () (_ BitVec 4))
(declare-fun prop_signal__AT25 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT25| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT25 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT25| () (_ BitVec 1))
(declare-fun flat_data_in__AT24 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT25| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT25 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT25| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT25 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT25| () (_ BitVec 8))
(declare-fun start__AT25 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT25| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT25 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT25 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT25 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT25| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT25 () (_ BitVec 8))
(declare-fun push__AT25 () (_ BitVec 2))
(declare-fun pop__AT25 () (_ BitVec 2))
(declare-fun full__AT25 () (_ BitVec 2))
(declare-fun data_out_vld__AT25 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT25| () (_ BitVec 8))
(declare-fun af.gnt__AT25 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT25| () (_ BitVec 4))
(declare-fun reqs__AT25 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT25| () (_ BitVec 4))
(declare-fun empty__AT25 () (_ BitVec 2))
(declare-fun N25__AT25 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT25| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT25| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT25)) (bvnot ((_ extract 1 1) push__AT25))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT25)) (bvnot ((_ extract 0 0) push__AT25))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT25)) (bvnot ((_ extract 0 0) reqs__AT25))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT25)) (bvnot ((_ extract 1 1) reqs__AT25))) #b1))
(assert true)
(assert (= prop_signal__AT25 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT25 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT25 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) #b0000)) ((_ extract 0 0) N25__AT25))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT25 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|)) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) ((_ extract 1 1) N25__AT25))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|)) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) ((_ extract 0 0) N25__AT25))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT25 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))))))
(assert (= sb.mpt.ff_cnt.en__AT25 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT25) ((_ extract 0 0) N25__AT25)) rst__AT25) sb.ff_en.Q__AT25))))
(assert (= sb.mpt.ff_cnt.D__AT25 ((_ zero_extend 0) (ite (= rst__AT25 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) #b0000)) ((_ extract 0 0) N25__AT25))))))))
(assert (= sb.ff_magic_packet.en__AT25 ((_ zero_extend 0) (bvand (bvand start__AT25 ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))))
(assert (= sb.ff_en.en__AT25 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT25))))
(assert (= sb.ff_en.D__AT25 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT25 (bvand start__AT25 ((_ extract 0 0) push__AT25))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT25 #b00)) (bvnot (bvnot (bvcomp N25__AT25 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT25 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT25 reqs__AT25)) ((_ extract 1 1) (bvand N25__AT25 reqs__AT25))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT25 #b00))) (bvand (bvnot (bvcomp N25__AT25 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT25) (bvsub ((_ zero_extend 30) N25__AT25) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT25 ((_ zero_extend 0) N25__AT25)))
(assert (= data_out_vld__AT25 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT25 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT25 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) #b0000)) ((_ extract 0 0) N25__AT25))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT25| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|)) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) ((_ extract 0 0) N25__AT25))))))))))))
(assert (= af.gnt__AT25 ((_ zero_extend 0) N25__AT25)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT25| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT25| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|)))
(assert (= full__AT25 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|)))))))
(assert (= |af.gen_fifos[1].f.full__AT25| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT25| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT25| (concat #b000 ((_ extract 1 1) push__AT25))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT25| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT25| (concat #b000 ((_ extract 1 1) N25__AT25))))))
(assert (= empty__AT25 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT25| |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT25| |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|))))
(assert (= |af.gen_fifos[1].f.empty__AT25| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT25| |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT25| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT25) ((_ extract 1 1) N25__AT25)) rst__AT25))))
(assert (= data_out__AT25 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|)) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) (concat ((_ extract 1 1) N25__AT25) ((_ extract 1 1) N25__AT25))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|)) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) (concat ((_ extract 0 0) N25__AT25) ((_ extract 0 0) N25__AT25))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT25| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT25| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|)))
(assert (= |af.gen_fifos[0].f.full__AT25| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT25| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| (concat #b000 ((_ extract 0 0) push__AT25))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT25| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT25| (concat #b000 ((_ extract 0 0) N25__AT25))))))
(assert (= |af.gen_fifos[0].f.empty__AT25| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT25| |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT25| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT25) ((_ extract 0 0) N25__AT25)) rst__AT25))))
(assert (= |af.fifo_data_out[1]__AT25| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|)))))
(assert (= |af.fifo_data_out[0]__AT25| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|)))))
(assert (= rst__AT25 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT25 (ite (= rst__AT24 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT24) ((_ extract 0 0) N25__AT24)) rst__AT24) sb.ff_en.Q__AT24) #b1) (ite (= rst__AT24 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT24 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT24 #b1000)) ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)))) #b0000)) ((_ extract 0 0) N25__AT24))))) sb.mpt.ff_cnt.Q__AT24))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT25| (ite (= rst__AT24 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT24) ((_ extract 0 0) N25__AT24)) rst__AT24) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT24| (concat #b000 ((_ extract 0 0) N25__AT24))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT24|))))
(assert (= sb.ff_en.Q__AT25 (ite (= rst__AT24 #b1) #b0 (ite (= sb.ff_en.Q__AT24 #b1) #b1 (bvor sb.ff_en.Q__AT24 (bvand start__AT24 ((_ extract 0 0) push__AT24)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| (ite (= rst__AT24 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT24) ((_ extract 0 0) N25__AT24)) rst__AT24) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| (concat #b000 ((_ extract 0 0) push__AT24))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT25| (ite (= rst__AT24 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT24) ((_ extract 1 1) N25__AT24)) rst__AT24) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT24| (concat #b000 ((_ extract 1 1) N25__AT24))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT24|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT25| (ite (= rst__AT24 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT24) ((_ extract 1 1) N25__AT24)) rst__AT24) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT24| (concat #b000 ((_ extract 1 1) push__AT24))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|))))
(assert (= |af.gen_fifos[1].f.entries__AT25| (store |af.gen_fifos[1].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|) (bvor (bvand (concat ((_ extract 1 1) push__AT24) (concat ((_ extract 1 1) push__AT24) (concat ((_ extract 1 1) push__AT24) (concat ((_ extract 1 1) push__AT24) (concat ((_ extract 1 1) push__AT24) (concat ((_ extract 1 1) push__AT24) (concat ((_ extract 1 1) push__AT24) ((_ extract 1 1) push__AT24)))))))) ((_ extract 15 8) flat_data_in__AT24)) (bvand (concat (bvnot ((_ extract 1 1) push__AT24)) (concat (bvnot ((_ extract 1 1) push__AT24)) (concat (bvnot ((_ extract 1 1) push__AT24)) (concat (bvnot ((_ extract 1 1) push__AT24)) (concat (bvnot ((_ extract 1 1) push__AT24)) (concat (bvnot ((_ extract 1 1) push__AT24)) (concat (bvnot ((_ extract 1 1) push__AT24)) (bvnot ((_ extract 1 1) push__AT24))))))))) (select |af.gen_fifos[1].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT24|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT25| (store |af.gen_fifos[0].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|) (bvor (bvand (concat ((_ extract 0 0) push__AT24) (concat ((_ extract 0 0) push__AT24) (concat ((_ extract 0 0) push__AT24) (concat ((_ extract 0 0) push__AT24) (concat ((_ extract 0 0) push__AT24) (concat ((_ extract 0 0) push__AT24) (concat ((_ extract 0 0) push__AT24) ((_ extract 0 0) push__AT24)))))))) ((_ extract 7 0) flat_data_in__AT24)) (bvand (concat (bvnot ((_ extract 0 0) push__AT24)) (concat (bvnot ((_ extract 0 0) push__AT24)) (concat (bvnot ((_ extract 0 0) push__AT24)) (concat (bvnot ((_ extract 0 0) push__AT24)) (concat (bvnot ((_ extract 0 0) push__AT24)) (concat (bvnot ((_ extract 0 0) push__AT24)) (concat (bvnot ((_ extract 0 0) push__AT24)) (bvnot ((_ extract 0 0) push__AT24))))))))) (select |af.gen_fifos[0].f.entries__AT24| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT24|)))))))
(assert (= sb.ff_magic_packet.Q__AT25 (ite (= rst__AT24 #b1) #b00000000 (ite (= (bvand (bvand start__AT24 ((_ extract 0 0) push__AT24)) (bvnot sb.ff_en.Q__AT24)) #b1) ((_ extract 7 0) flat_data_in__AT24) sb.ff_magic_packet.Q__AT24))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT25 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop25 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en2_prop25 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en3_prop25 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en4_prop25 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en5_prop25 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en6_prop25 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en7_prop25 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en8_prop25 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en9_prop25 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en10_prop25 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en11_prop25 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en12_prop25 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en13_prop25 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en14_prop25 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en15_prop25 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en16_prop25 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en17_prop25 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en18_prop25 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en19_prop25 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en20_prop25 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en21_prop25 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en22_prop25 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en23_prop25 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en24_prop25 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(define-fun en25_prop25 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT25 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))

(check-sat-assuming ((not (and en1_prop25 en2_prop25 en3_prop25 en4_prop25 en5_prop25 en6_prop25 en7_prop25 en8_prop25 en9_prop25 en10_prop25 en11_prop25 en12_prop25 en13_prop25 en14_prop25 en15_prop25 en16_prop25 en17_prop25 en18_prop25 en19_prop25 en20_prop25 en21_prop25 en22_prop25 en23_prop25 en24_prop25 en25_prop25))))



(echo "Checking property at bound 25")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[0].f.entries__AT26| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT26 () (_ BitVec 8))
(declare-fun push__AT26 () (_ BitVec 2))
(declare-fun pop__AT26 () (_ BitVec 2))
(declare-fun full__AT26 () (_ BitVec 2))
(declare-fun data_out_vld__AT26 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT26| () (_ BitVec 8))
(declare-fun af.gnt__AT26 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT26| () (_ BitVec 4))
(declare-fun reqs__AT26 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT26| () (_ BitVec 4))
(declare-fun empty__AT26 () (_ BitVec 2))
(declare-fun N25__AT26 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT26| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT26| () (_ BitVec 4))
(declare-fun rst__AT26 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT26| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT26 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT26| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT26| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT26| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT26 () (_ BitVec 1))
(declare-fun data_out__AT26 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT26| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT26| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT26| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT26| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT26| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT26| () (_ BitVec 4))
(declare-fun prop_signal__AT26 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT26| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT26 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT26| () (_ BitVec 1))
(declare-fun flat_data_in__AT25 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT26| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT26 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT26| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT26 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT26| () (_ BitVec 8))
(declare-fun start__AT26 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT26| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT26 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT26 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT26 () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT26)) (bvnot ((_ extract 1 1) push__AT26))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT26)) (bvnot ((_ extract 0 0) push__AT26))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT26)) (bvnot ((_ extract 0 0) reqs__AT26))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT26)) (bvnot ((_ extract 1 1) reqs__AT26))) #b1))
(assert true)
(assert (= prop_signal__AT26 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT26 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT26 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) #b0000)) ((_ extract 0 0) N25__AT26))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT26 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|)) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) ((_ extract 1 1) N25__AT26))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|)) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) ((_ extract 0 0) N25__AT26))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT26 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))))))
(assert (= sb.mpt.ff_cnt.en__AT26 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT26) ((_ extract 0 0) N25__AT26)) rst__AT26) sb.ff_en.Q__AT26))))
(assert (= sb.mpt.ff_cnt.D__AT26 ((_ zero_extend 0) (ite (= rst__AT26 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) #b0000)) ((_ extract 0 0) N25__AT26))))))))
(assert (= sb.ff_magic_packet.en__AT26 ((_ zero_extend 0) (bvand (bvand start__AT26 ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))))
(assert (= sb.ff_en.en__AT26 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT26))))
(assert (= sb.ff_en.D__AT26 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT26 (bvand start__AT26 ((_ extract 0 0) push__AT26))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT26 #b00)) (bvnot (bvnot (bvcomp N25__AT26 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT26 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT26 reqs__AT26)) ((_ extract 1 1) (bvand N25__AT26 reqs__AT26))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT26 #b00))) (bvand (bvnot (bvcomp N25__AT26 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT26) (bvsub ((_ zero_extend 30) N25__AT26) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT26 ((_ zero_extend 0) N25__AT26)))
(assert (= data_out_vld__AT26 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT26 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT26 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) #b0000)) ((_ extract 0 0) N25__AT26))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT26| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|)) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) ((_ extract 0 0) N25__AT26))))))))))))
(assert (= af.gnt__AT26 ((_ zero_extend 0) N25__AT26)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT26| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT26| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|)))
(assert (= full__AT26 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|)))))))
(assert (= |af.gen_fifos[1].f.full__AT26| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT26| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT26| (concat #b000 ((_ extract 1 1) push__AT26))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT26| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT26| (concat #b000 ((_ extract 1 1) N25__AT26))))))
(assert (= empty__AT26 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT26| |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT26| |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|))))
(assert (= |af.gen_fifos[1].f.empty__AT26| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT26| |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT26| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT26) ((_ extract 1 1) N25__AT26)) rst__AT26))))
(assert (= data_out__AT26 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|)) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) (concat ((_ extract 1 1) N25__AT26) ((_ extract 1 1) N25__AT26))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|)) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) (concat ((_ extract 0 0) N25__AT26) ((_ extract 0 0) N25__AT26))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT26| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT26| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|)))
(assert (= |af.gen_fifos[0].f.full__AT26| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT26| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| (concat #b000 ((_ extract 0 0) push__AT26))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT26| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT26| (concat #b000 ((_ extract 0 0) N25__AT26))))))
(assert (= |af.gen_fifos[0].f.empty__AT26| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT26| |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT26| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT26) ((_ extract 0 0) N25__AT26)) rst__AT26))))
(assert (= |af.fifo_data_out[1]__AT26| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|)))))
(assert (= |af.fifo_data_out[0]__AT26| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|)))))
(assert (= rst__AT26 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT26 (ite (= rst__AT25 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT25) ((_ extract 0 0) N25__AT25)) rst__AT25) sb.ff_en.Q__AT25) #b1) (ite (= rst__AT25 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT25 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT25 #b1000)) ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)))) #b0000)) ((_ extract 0 0) N25__AT25))))) sb.mpt.ff_cnt.Q__AT25))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT26| (ite (= rst__AT25 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT25) ((_ extract 0 0) N25__AT25)) rst__AT25) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT25| (concat #b000 ((_ extract 0 0) N25__AT25))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT25|))))
(assert (= sb.ff_en.Q__AT26 (ite (= rst__AT25 #b1) #b0 (ite (= sb.ff_en.Q__AT25 #b1) #b1 (bvor sb.ff_en.Q__AT25 (bvand start__AT25 ((_ extract 0 0) push__AT25)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| (ite (= rst__AT25 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT25) ((_ extract 0 0) N25__AT25)) rst__AT25) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| (concat #b000 ((_ extract 0 0) push__AT25))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT26| (ite (= rst__AT25 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT25) ((_ extract 1 1) N25__AT25)) rst__AT25) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT25| (concat #b000 ((_ extract 1 1) N25__AT25))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT25|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT26| (ite (= rst__AT25 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT25) ((_ extract 1 1) N25__AT25)) rst__AT25) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT25| (concat #b000 ((_ extract 1 1) push__AT25))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|))))
(assert (= |af.gen_fifos[1].f.entries__AT26| (store |af.gen_fifos[1].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|) (bvor (bvand (concat ((_ extract 1 1) push__AT25) (concat ((_ extract 1 1) push__AT25) (concat ((_ extract 1 1) push__AT25) (concat ((_ extract 1 1) push__AT25) (concat ((_ extract 1 1) push__AT25) (concat ((_ extract 1 1) push__AT25) (concat ((_ extract 1 1) push__AT25) ((_ extract 1 1) push__AT25)))))))) ((_ extract 15 8) flat_data_in__AT25)) (bvand (concat (bvnot ((_ extract 1 1) push__AT25)) (concat (bvnot ((_ extract 1 1) push__AT25)) (concat (bvnot ((_ extract 1 1) push__AT25)) (concat (bvnot ((_ extract 1 1) push__AT25)) (concat (bvnot ((_ extract 1 1) push__AT25)) (concat (bvnot ((_ extract 1 1) push__AT25)) (concat (bvnot ((_ extract 1 1) push__AT25)) (bvnot ((_ extract 1 1) push__AT25))))))))) (select |af.gen_fifos[1].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT25|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT26| (store |af.gen_fifos[0].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|) (bvor (bvand (concat ((_ extract 0 0) push__AT25) (concat ((_ extract 0 0) push__AT25) (concat ((_ extract 0 0) push__AT25) (concat ((_ extract 0 0) push__AT25) (concat ((_ extract 0 0) push__AT25) (concat ((_ extract 0 0) push__AT25) (concat ((_ extract 0 0) push__AT25) ((_ extract 0 0) push__AT25)))))))) ((_ extract 7 0) flat_data_in__AT25)) (bvand (concat (bvnot ((_ extract 0 0) push__AT25)) (concat (bvnot ((_ extract 0 0) push__AT25)) (concat (bvnot ((_ extract 0 0) push__AT25)) (concat (bvnot ((_ extract 0 0) push__AT25)) (concat (bvnot ((_ extract 0 0) push__AT25)) (concat (bvnot ((_ extract 0 0) push__AT25)) (concat (bvnot ((_ extract 0 0) push__AT25)) (bvnot ((_ extract 0 0) push__AT25))))))))) (select |af.gen_fifos[0].f.entries__AT25| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT25|)))))))
(assert (= sb.ff_magic_packet.Q__AT26 (ite (= rst__AT25 #b1) #b00000000 (ite (= (bvand (bvand start__AT25 ((_ extract 0 0) push__AT25)) (bvnot sb.ff_en.Q__AT25)) #b1) ((_ extract 7 0) flat_data_in__AT25) sb.ff_magic_packet.Q__AT25))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT26 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop26 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en2_prop26 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en3_prop26 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en4_prop26 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en5_prop26 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en6_prop26 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en7_prop26 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en8_prop26 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en9_prop26 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en10_prop26 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en11_prop26 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en12_prop26 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en13_prop26 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en14_prop26 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en15_prop26 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en16_prop26 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en17_prop26 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en18_prop26 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en19_prop26 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en20_prop26 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en21_prop26 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en22_prop26 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en23_prop26 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en24_prop26 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en25_prop26 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(define-fun en26_prop26 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT26 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))

(check-sat-assuming ((not (and en1_prop26 en2_prop26 en3_prop26 en4_prop26 en5_prop26 en6_prop26 en7_prop26 en8_prop26 en9_prop26 en10_prop26 en11_prop26 en12_prop26 en13_prop26 en14_prop26 en15_prop26 en16_prop26 en17_prop26 en18_prop26 en19_prop26 en20_prop26 en21_prop26 en22_prop26 en23_prop26 en24_prop26 en25_prop26 en26_prop26))))



(echo "Checking property at bound 26")

(check-sat)

(pop 1)
(declare-fun sb.ff_en.Q__AT27 () (_ BitVec 1))
(declare-fun data_out__AT27 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT27| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT27| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT27| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT27| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT27| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT27| () (_ BitVec 4))
(declare-fun prop_signal__AT27 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT27| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT27 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT27| () (_ BitVec 1))
(declare-fun flat_data_in__AT26 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT27| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT27 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT27| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT27 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT27| () (_ BitVec 8))
(declare-fun start__AT27 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT27| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT27 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT27 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT27 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT27| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT27 () (_ BitVec 8))
(declare-fun push__AT27 () (_ BitVec 2))
(declare-fun pop__AT27 () (_ BitVec 2))
(declare-fun full__AT27 () (_ BitVec 2))
(declare-fun data_out_vld__AT27 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT27| () (_ BitVec 8))
(declare-fun af.gnt__AT27 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT27| () (_ BitVec 4))
(declare-fun reqs__AT27 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT27| () (_ BitVec 4))
(declare-fun empty__AT27 () (_ BitVec 2))
(declare-fun N25__AT27 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT27| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT27| () (_ BitVec 4))
(declare-fun rst__AT27 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT27| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT27 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT27| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT27| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT27| () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT27)) (bvnot ((_ extract 1 1) push__AT27))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT27)) (bvnot ((_ extract 0 0) push__AT27))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT27)) (bvnot ((_ extract 0 0) reqs__AT27))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT27)) (bvnot ((_ extract 1 1) reqs__AT27))) #b1))
(assert true)
(assert (= prop_signal__AT27 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT27 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT27 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) #b0000)) ((_ extract 0 0) N25__AT27))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT27 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|)) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) ((_ extract 1 1) N25__AT27))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|)) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) ((_ extract 0 0) N25__AT27))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT27 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))))))
(assert (= sb.mpt.ff_cnt.en__AT27 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT27) ((_ extract 0 0) N25__AT27)) rst__AT27) sb.ff_en.Q__AT27))))
(assert (= sb.mpt.ff_cnt.D__AT27 ((_ zero_extend 0) (ite (= rst__AT27 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) #b0000)) ((_ extract 0 0) N25__AT27))))))))
(assert (= sb.ff_magic_packet.en__AT27 ((_ zero_extend 0) (bvand (bvand start__AT27 ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))))
(assert (= sb.ff_en.en__AT27 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT27))))
(assert (= sb.ff_en.D__AT27 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT27 (bvand start__AT27 ((_ extract 0 0) push__AT27))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT27 #b00)) (bvnot (bvnot (bvcomp N25__AT27 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT27 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT27 reqs__AT27)) ((_ extract 1 1) (bvand N25__AT27 reqs__AT27))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT27 #b00))) (bvand (bvnot (bvcomp N25__AT27 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT27) (bvsub ((_ zero_extend 30) N25__AT27) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT27 ((_ zero_extend 0) N25__AT27)))
(assert (= data_out_vld__AT27 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT27 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT27 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) #b0000)) ((_ extract 0 0) N25__AT27))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT27| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|)) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) ((_ extract 0 0) N25__AT27))))))))))))
(assert (= af.gnt__AT27 ((_ zero_extend 0) N25__AT27)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT27| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT27| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|)))
(assert (= full__AT27 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|)))))))
(assert (= |af.gen_fifos[1].f.full__AT27| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT27| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT27| (concat #b000 ((_ extract 1 1) push__AT27))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT27| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT27| (concat #b000 ((_ extract 1 1) N25__AT27))))))
(assert (= empty__AT27 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT27| |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT27| |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|))))
(assert (= |af.gen_fifos[1].f.empty__AT27| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT27| |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT27| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT27) ((_ extract 1 1) N25__AT27)) rst__AT27))))
(assert (= data_out__AT27 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|)) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) (concat ((_ extract 1 1) N25__AT27) ((_ extract 1 1) N25__AT27))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|)) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) (concat ((_ extract 0 0) N25__AT27) ((_ extract 0 0) N25__AT27))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT27| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT27| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|)))
(assert (= |af.gen_fifos[0].f.full__AT27| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT27| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| (concat #b000 ((_ extract 0 0) push__AT27))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT27| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT27| (concat #b000 ((_ extract 0 0) N25__AT27))))))
(assert (= |af.gen_fifos[0].f.empty__AT27| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT27| |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT27| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT27) ((_ extract 0 0) N25__AT27)) rst__AT27))))
(assert (= |af.fifo_data_out[1]__AT27| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|)))))
(assert (= |af.fifo_data_out[0]__AT27| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|)))))
(assert (= rst__AT27 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT27 (ite (= rst__AT26 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT26) ((_ extract 0 0) N25__AT26)) rst__AT26) sb.ff_en.Q__AT26) #b1) (ite (= rst__AT26 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT26 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT26 #b1000)) ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)))) #b0000)) ((_ extract 0 0) N25__AT26))))) sb.mpt.ff_cnt.Q__AT26))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT27| (ite (= rst__AT26 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT26) ((_ extract 0 0) N25__AT26)) rst__AT26) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT26| (concat #b000 ((_ extract 0 0) N25__AT26))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT26|))))
(assert (= sb.ff_en.Q__AT27 (ite (= rst__AT26 #b1) #b0 (ite (= sb.ff_en.Q__AT26 #b1) #b1 (bvor sb.ff_en.Q__AT26 (bvand start__AT26 ((_ extract 0 0) push__AT26)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| (ite (= rst__AT26 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT26) ((_ extract 0 0) N25__AT26)) rst__AT26) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| (concat #b000 ((_ extract 0 0) push__AT26))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT27| (ite (= rst__AT26 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT26) ((_ extract 1 1) N25__AT26)) rst__AT26) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT26| (concat #b000 ((_ extract 1 1) N25__AT26))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT26|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT27| (ite (= rst__AT26 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT26) ((_ extract 1 1) N25__AT26)) rst__AT26) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT26| (concat #b000 ((_ extract 1 1) push__AT26))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|))))
(assert (= |af.gen_fifos[1].f.entries__AT27| (store |af.gen_fifos[1].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|) (bvor (bvand (concat ((_ extract 1 1) push__AT26) (concat ((_ extract 1 1) push__AT26) (concat ((_ extract 1 1) push__AT26) (concat ((_ extract 1 1) push__AT26) (concat ((_ extract 1 1) push__AT26) (concat ((_ extract 1 1) push__AT26) (concat ((_ extract 1 1) push__AT26) ((_ extract 1 1) push__AT26)))))))) ((_ extract 15 8) flat_data_in__AT26)) (bvand (concat (bvnot ((_ extract 1 1) push__AT26)) (concat (bvnot ((_ extract 1 1) push__AT26)) (concat (bvnot ((_ extract 1 1) push__AT26)) (concat (bvnot ((_ extract 1 1) push__AT26)) (concat (bvnot ((_ extract 1 1) push__AT26)) (concat (bvnot ((_ extract 1 1) push__AT26)) (concat (bvnot ((_ extract 1 1) push__AT26)) (bvnot ((_ extract 1 1) push__AT26))))))))) (select |af.gen_fifos[1].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT26|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT27| (store |af.gen_fifos[0].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|) (bvor (bvand (concat ((_ extract 0 0) push__AT26) (concat ((_ extract 0 0) push__AT26) (concat ((_ extract 0 0) push__AT26) (concat ((_ extract 0 0) push__AT26) (concat ((_ extract 0 0) push__AT26) (concat ((_ extract 0 0) push__AT26) (concat ((_ extract 0 0) push__AT26) ((_ extract 0 0) push__AT26)))))))) ((_ extract 7 0) flat_data_in__AT26)) (bvand (concat (bvnot ((_ extract 0 0) push__AT26)) (concat (bvnot ((_ extract 0 0) push__AT26)) (concat (bvnot ((_ extract 0 0) push__AT26)) (concat (bvnot ((_ extract 0 0) push__AT26)) (concat (bvnot ((_ extract 0 0) push__AT26)) (concat (bvnot ((_ extract 0 0) push__AT26)) (concat (bvnot ((_ extract 0 0) push__AT26)) (bvnot ((_ extract 0 0) push__AT26))))))))) (select |af.gen_fifos[0].f.entries__AT26| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT26|)))))))
(assert (= sb.ff_magic_packet.Q__AT27 (ite (= rst__AT26 #b1) #b00000000 (ite (= (bvand (bvand start__AT26 ((_ extract 0 0) push__AT26)) (bvnot sb.ff_en.Q__AT26)) #b1) ((_ extract 7 0) flat_data_in__AT26) sb.ff_magic_packet.Q__AT26))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT27 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop27 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en2_prop27 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en3_prop27 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en4_prop27 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en5_prop27 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en6_prop27 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en7_prop27 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en8_prop27 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en9_prop27 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en10_prop27 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en11_prop27 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en12_prop27 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en13_prop27 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en14_prop27 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en15_prop27 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en16_prop27 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en17_prop27 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en18_prop27 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en19_prop27 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en20_prop27 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en21_prop27 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en22_prop27 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en23_prop27 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en24_prop27 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en25_prop27 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en26_prop27 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(define-fun en27_prop27 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT27 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))

(check-sat-assuming ((not (and en1_prop27 en2_prop27 en3_prop27 en4_prop27 en5_prop27 en6_prop27 en7_prop27 en8_prop27 en9_prop27 en10_prop27 en11_prop27 en12_prop27 en13_prop27 en14_prop27 en15_prop27 en16_prop27 en17_prop27 en18_prop27 en19_prop27 en20_prop27 en21_prop27 en22_prop27 en23_prop27 en24_prop27 en25_prop27 en26_prop27 en27_prop27))))



(echo "Checking property at bound 27")

(check-sat)

(pop 1)
(declare-fun full__AT28 () (_ BitVec 2))
(declare-fun data_out_vld__AT28 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT28| () (_ BitVec 8))
(declare-fun af.gnt__AT28 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT28| () (_ BitVec 4))
(declare-fun reqs__AT28 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT28| () (_ BitVec 4))
(declare-fun empty__AT28 () (_ BitVec 2))
(declare-fun N25__AT28 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT28| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT28| () (_ BitVec 4))
(declare-fun rst__AT28 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT28| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT28 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT28| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT28| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT28| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT28 () (_ BitVec 1))
(declare-fun data_out__AT28 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT28| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT28| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT28| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT28| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT28| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT28| () (_ BitVec 4))
(declare-fun prop_signal__AT28 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT28| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT28 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT28| () (_ BitVec 1))
(declare-fun flat_data_in__AT27 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT28| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT28 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT28| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT28 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT28| () (_ BitVec 8))
(declare-fun start__AT28 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT28 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT28| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.en__AT28 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT28 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT28| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT28 () (_ BitVec 8))
(declare-fun push__AT28 () (_ BitVec 2))
(declare-fun pop__AT28 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT28)) (bvnot ((_ extract 1 1) push__AT28))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT28)) (bvnot ((_ extract 0 0) push__AT28))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT28)) (bvnot ((_ extract 0 0) reqs__AT28))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT28)) (bvnot ((_ extract 1 1) reqs__AT28))) #b1))
(assert true)
(assert (= prop_signal__AT28 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT28 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT28 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) #b0000)) ((_ extract 0 0) N25__AT28))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT28 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|)) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) ((_ extract 1 1) N25__AT28))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|)) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) ((_ extract 0 0) N25__AT28))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT28 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))))))
(assert (= sb.mpt.ff_cnt.en__AT28 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT28) ((_ extract 0 0) N25__AT28)) rst__AT28) sb.ff_en.Q__AT28))))
(assert (= sb.mpt.ff_cnt.D__AT28 ((_ zero_extend 0) (ite (= rst__AT28 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) #b0000)) ((_ extract 0 0) N25__AT28))))))))
(assert (= sb.ff_magic_packet.en__AT28 ((_ zero_extend 0) (bvand (bvand start__AT28 ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))))
(assert (= sb.ff_en.en__AT28 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT28))))
(assert (= sb.ff_en.D__AT28 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT28 (bvand start__AT28 ((_ extract 0 0) push__AT28))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT28 #b00)) (bvnot (bvnot (bvcomp N25__AT28 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT28 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT28 reqs__AT28)) ((_ extract 1 1) (bvand N25__AT28 reqs__AT28))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT28 #b00))) (bvand (bvnot (bvcomp N25__AT28 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT28) (bvsub ((_ zero_extend 30) N25__AT28) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT28 ((_ zero_extend 0) N25__AT28)))
(assert (= data_out_vld__AT28 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT28 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT28 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) #b0000)) ((_ extract 0 0) N25__AT28))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT28| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|)) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) ((_ extract 0 0) N25__AT28))))))))))))
(assert (= af.gnt__AT28 ((_ zero_extend 0) N25__AT28)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT28| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT28| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|)))
(assert (= full__AT28 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|)))))))
(assert (= |af.gen_fifos[1].f.full__AT28| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT28| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT28| (concat #b000 ((_ extract 1 1) push__AT28))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT28| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT28| (concat #b000 ((_ extract 1 1) N25__AT28))))))
(assert (= empty__AT28 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT28| |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT28| |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|))))
(assert (= |af.gen_fifos[1].f.empty__AT28| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT28| |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT28| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT28) ((_ extract 1 1) N25__AT28)) rst__AT28))))
(assert (= data_out__AT28 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|)) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) (concat ((_ extract 1 1) N25__AT28) ((_ extract 1 1) N25__AT28))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|)) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) (concat ((_ extract 0 0) N25__AT28) ((_ extract 0 0) N25__AT28))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT28| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT28| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|)))
(assert (= |af.gen_fifos[0].f.full__AT28| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT28| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| (concat #b000 ((_ extract 0 0) push__AT28))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT28| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT28| (concat #b000 ((_ extract 0 0) N25__AT28))))))
(assert (= |af.gen_fifos[0].f.empty__AT28| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT28| |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT28| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT28) ((_ extract 0 0) N25__AT28)) rst__AT28))))
(assert (= |af.fifo_data_out[1]__AT28| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|)))))
(assert (= |af.fifo_data_out[0]__AT28| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|)))))
(assert (= rst__AT28 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT28 (ite (= rst__AT27 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT27) ((_ extract 0 0) N25__AT27)) rst__AT27) sb.ff_en.Q__AT27) #b1) (ite (= rst__AT27 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT27 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT27 #b1000)) ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)))) #b0000)) ((_ extract 0 0) N25__AT27))))) sb.mpt.ff_cnt.Q__AT27))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT28| (ite (= rst__AT27 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT27) ((_ extract 0 0) N25__AT27)) rst__AT27) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT27| (concat #b000 ((_ extract 0 0) N25__AT27))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT27|))))
(assert (= sb.ff_en.Q__AT28 (ite (= rst__AT27 #b1) #b0 (ite (= sb.ff_en.Q__AT27 #b1) #b1 (bvor sb.ff_en.Q__AT27 (bvand start__AT27 ((_ extract 0 0) push__AT27)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| (ite (= rst__AT27 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT27) ((_ extract 0 0) N25__AT27)) rst__AT27) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| (concat #b000 ((_ extract 0 0) push__AT27))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT28| (ite (= rst__AT27 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT27) ((_ extract 1 1) N25__AT27)) rst__AT27) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT27| (concat #b000 ((_ extract 1 1) N25__AT27))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT27|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT28| (ite (= rst__AT27 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT27) ((_ extract 1 1) N25__AT27)) rst__AT27) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT27| (concat #b000 ((_ extract 1 1) push__AT27))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|))))
(assert (= |af.gen_fifos[1].f.entries__AT28| (store |af.gen_fifos[1].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|) (bvor (bvand (concat ((_ extract 1 1) push__AT27) (concat ((_ extract 1 1) push__AT27) (concat ((_ extract 1 1) push__AT27) (concat ((_ extract 1 1) push__AT27) (concat ((_ extract 1 1) push__AT27) (concat ((_ extract 1 1) push__AT27) (concat ((_ extract 1 1) push__AT27) ((_ extract 1 1) push__AT27)))))))) ((_ extract 15 8) flat_data_in__AT27)) (bvand (concat (bvnot ((_ extract 1 1) push__AT27)) (concat (bvnot ((_ extract 1 1) push__AT27)) (concat (bvnot ((_ extract 1 1) push__AT27)) (concat (bvnot ((_ extract 1 1) push__AT27)) (concat (bvnot ((_ extract 1 1) push__AT27)) (concat (bvnot ((_ extract 1 1) push__AT27)) (concat (bvnot ((_ extract 1 1) push__AT27)) (bvnot ((_ extract 1 1) push__AT27))))))))) (select |af.gen_fifos[1].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT27|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT28| (store |af.gen_fifos[0].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|) (bvor (bvand (concat ((_ extract 0 0) push__AT27) (concat ((_ extract 0 0) push__AT27) (concat ((_ extract 0 0) push__AT27) (concat ((_ extract 0 0) push__AT27) (concat ((_ extract 0 0) push__AT27) (concat ((_ extract 0 0) push__AT27) (concat ((_ extract 0 0) push__AT27) ((_ extract 0 0) push__AT27)))))))) ((_ extract 7 0) flat_data_in__AT27)) (bvand (concat (bvnot ((_ extract 0 0) push__AT27)) (concat (bvnot ((_ extract 0 0) push__AT27)) (concat (bvnot ((_ extract 0 0) push__AT27)) (concat (bvnot ((_ extract 0 0) push__AT27)) (concat (bvnot ((_ extract 0 0) push__AT27)) (concat (bvnot ((_ extract 0 0) push__AT27)) (concat (bvnot ((_ extract 0 0) push__AT27)) (bvnot ((_ extract 0 0) push__AT27))))))))) (select |af.gen_fifos[0].f.entries__AT27| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT27|)))))))
(assert (= sb.ff_magic_packet.Q__AT28 (ite (= rst__AT27 #b1) #b00000000 (ite (= (bvand (bvand start__AT27 ((_ extract 0 0) push__AT27)) (bvnot sb.ff_en.Q__AT27)) #b1) ((_ extract 7 0) flat_data_in__AT27) sb.ff_magic_packet.Q__AT27))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT28 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop28 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en2_prop28 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en3_prop28 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en4_prop28 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en5_prop28 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en6_prop28 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en7_prop28 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en8_prop28 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en9_prop28 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en10_prop28 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en11_prop28 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en12_prop28 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en13_prop28 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en14_prop28 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en15_prop28 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en16_prop28 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en17_prop28 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en18_prop28 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en19_prop28 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en20_prop28 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en21_prop28 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en22_prop28 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en23_prop28 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en24_prop28 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en25_prop28 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en26_prop28 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en27_prop28 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(define-fun en28_prop28 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT28 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))

(check-sat-assuming ((not (and en1_prop28 en2_prop28 en3_prop28 en4_prop28 en5_prop28 en6_prop28 en7_prop28 en8_prop28 en9_prop28 en10_prop28 en11_prop28 en12_prop28 en13_prop28 en14_prop28 en15_prop28 en16_prop28 en17_prop28 en18_prop28 en19_prop28 en20_prop28 en21_prop28 en22_prop28 en23_prop28 en24_prop28 en25_prop28 en26_prop28 en27_prop28 en28_prop28))))



(echo "Checking property at bound 28")

(check-sat)

(pop 1)
(declare-fun prop_signal__AT29 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT29| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT29 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT29| () (_ BitVec 1))
(declare-fun flat_data_in__AT28 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT29| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT29 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT29| () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.full__AT29| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.D__AT29 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT29| () (_ BitVec 8))
(declare-fun start__AT29 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT29| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT29 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT29 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT29 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT29| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT29 () (_ BitVec 8))
(declare-fun push__AT29 () (_ BitVec 2))
(declare-fun pop__AT29 () (_ BitVec 2))
(declare-fun full__AT29 () (_ BitVec 2))
(declare-fun data_out_vld__AT29 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT29| () (_ BitVec 8))
(declare-fun af.gnt__AT29 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT29| () (_ BitVec 4))
(declare-fun reqs__AT29 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT29| () (_ BitVec 4))
(declare-fun empty__AT29 () (_ BitVec 2))
(declare-fun N25__AT29 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT29| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT29| () (_ BitVec 4))
(declare-fun rst__AT29 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT29| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT29 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT29| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT29| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT29| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT29 () (_ BitVec 1))
(declare-fun data_out__AT29 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT29| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT29| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT29| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT29| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT29| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT29)) (bvnot ((_ extract 1 1) push__AT29))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT29)) (bvnot ((_ extract 0 0) push__AT29))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT29)) (bvnot ((_ extract 0 0) reqs__AT29))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT29)) (bvnot ((_ extract 1 1) reqs__AT29))) #b1))
(assert true)
(assert (= prop_signal__AT29 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT29 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT29 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) #b0000)) ((_ extract 0 0) N25__AT29))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT29 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|)) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) ((_ extract 1 1) N25__AT29))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|)) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) ((_ extract 0 0) N25__AT29))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT29 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))))))
(assert (= sb.mpt.ff_cnt.en__AT29 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT29) ((_ extract 0 0) N25__AT29)) rst__AT29) sb.ff_en.Q__AT29))))
(assert (= sb.mpt.ff_cnt.D__AT29 ((_ zero_extend 0) (ite (= rst__AT29 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) #b0000)) ((_ extract 0 0) N25__AT29))))))))
(assert (= sb.ff_magic_packet.en__AT29 ((_ zero_extend 0) (bvand (bvand start__AT29 ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))))
(assert (= sb.ff_en.en__AT29 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT29))))
(assert (= sb.ff_en.D__AT29 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT29 (bvand start__AT29 ((_ extract 0 0) push__AT29))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT29 #b00)) (bvnot (bvnot (bvcomp N25__AT29 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT29 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT29 reqs__AT29)) ((_ extract 1 1) (bvand N25__AT29 reqs__AT29))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT29 #b00))) (bvand (bvnot (bvcomp N25__AT29 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT29) (bvsub ((_ zero_extend 30) N25__AT29) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT29 ((_ zero_extend 0) N25__AT29)))
(assert (= data_out_vld__AT29 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT29 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT29 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) #b0000)) ((_ extract 0 0) N25__AT29))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT29| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|)) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) ((_ extract 0 0) N25__AT29))))))))))))
(assert (= af.gnt__AT29 ((_ zero_extend 0) N25__AT29)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT29| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT29| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|)))
(assert (= full__AT29 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|)))))))
(assert (= |af.gen_fifos[1].f.full__AT29| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT29| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT29| (concat #b000 ((_ extract 1 1) push__AT29))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT29| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT29| (concat #b000 ((_ extract 1 1) N25__AT29))))))
(assert (= empty__AT29 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT29| |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT29| |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|))))
(assert (= |af.gen_fifos[1].f.empty__AT29| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT29| |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT29| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT29) ((_ extract 1 1) N25__AT29)) rst__AT29))))
(assert (= data_out__AT29 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|)) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) (concat ((_ extract 1 1) N25__AT29) ((_ extract 1 1) N25__AT29))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|)) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) (concat ((_ extract 0 0) N25__AT29) ((_ extract 0 0) N25__AT29))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT29| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT29| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|)))
(assert (= |af.gen_fifos[0].f.full__AT29| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT29| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| (concat #b000 ((_ extract 0 0) push__AT29))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT29| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT29| (concat #b000 ((_ extract 0 0) N25__AT29))))))
(assert (= |af.gen_fifos[0].f.empty__AT29| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT29| |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT29| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT29) ((_ extract 0 0) N25__AT29)) rst__AT29))))
(assert (= |af.fifo_data_out[1]__AT29| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|)))))
(assert (= |af.fifo_data_out[0]__AT29| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|)))))
(assert (= rst__AT29 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT29 (ite (= rst__AT28 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT28) ((_ extract 0 0) N25__AT28)) rst__AT28) sb.ff_en.Q__AT28) #b1) (ite (= rst__AT28 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT28 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT28 #b1000)) ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)))) #b0000)) ((_ extract 0 0) N25__AT28))))) sb.mpt.ff_cnt.Q__AT28))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT29| (ite (= rst__AT28 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT28) ((_ extract 0 0) N25__AT28)) rst__AT28) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT28| (concat #b000 ((_ extract 0 0) N25__AT28))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT28|))))
(assert (= sb.ff_en.Q__AT29 (ite (= rst__AT28 #b1) #b0 (ite (= sb.ff_en.Q__AT28 #b1) #b1 (bvor sb.ff_en.Q__AT28 (bvand start__AT28 ((_ extract 0 0) push__AT28)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| (ite (= rst__AT28 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT28) ((_ extract 0 0) N25__AT28)) rst__AT28) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| (concat #b000 ((_ extract 0 0) push__AT28))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT29| (ite (= rst__AT28 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT28) ((_ extract 1 1) N25__AT28)) rst__AT28) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT28| (concat #b000 ((_ extract 1 1) N25__AT28))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT28|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT29| (ite (= rst__AT28 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT28) ((_ extract 1 1) N25__AT28)) rst__AT28) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT28| (concat #b000 ((_ extract 1 1) push__AT28))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|))))
(assert (= |af.gen_fifos[1].f.entries__AT29| (store |af.gen_fifos[1].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|) (bvor (bvand (concat ((_ extract 1 1) push__AT28) (concat ((_ extract 1 1) push__AT28) (concat ((_ extract 1 1) push__AT28) (concat ((_ extract 1 1) push__AT28) (concat ((_ extract 1 1) push__AT28) (concat ((_ extract 1 1) push__AT28) (concat ((_ extract 1 1) push__AT28) ((_ extract 1 1) push__AT28)))))))) ((_ extract 15 8) flat_data_in__AT28)) (bvand (concat (bvnot ((_ extract 1 1) push__AT28)) (concat (bvnot ((_ extract 1 1) push__AT28)) (concat (bvnot ((_ extract 1 1) push__AT28)) (concat (bvnot ((_ extract 1 1) push__AT28)) (concat (bvnot ((_ extract 1 1) push__AT28)) (concat (bvnot ((_ extract 1 1) push__AT28)) (concat (bvnot ((_ extract 1 1) push__AT28)) (bvnot ((_ extract 1 1) push__AT28))))))))) (select |af.gen_fifos[1].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT28|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT29| (store |af.gen_fifos[0].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|) (bvor (bvand (concat ((_ extract 0 0) push__AT28) (concat ((_ extract 0 0) push__AT28) (concat ((_ extract 0 0) push__AT28) (concat ((_ extract 0 0) push__AT28) (concat ((_ extract 0 0) push__AT28) (concat ((_ extract 0 0) push__AT28) (concat ((_ extract 0 0) push__AT28) ((_ extract 0 0) push__AT28)))))))) ((_ extract 7 0) flat_data_in__AT28)) (bvand (concat (bvnot ((_ extract 0 0) push__AT28)) (concat (bvnot ((_ extract 0 0) push__AT28)) (concat (bvnot ((_ extract 0 0) push__AT28)) (concat (bvnot ((_ extract 0 0) push__AT28)) (concat (bvnot ((_ extract 0 0) push__AT28)) (concat (bvnot ((_ extract 0 0) push__AT28)) (concat (bvnot ((_ extract 0 0) push__AT28)) (bvnot ((_ extract 0 0) push__AT28))))))))) (select |af.gen_fifos[0].f.entries__AT28| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT28|)))))))
(assert (= sb.ff_magic_packet.Q__AT29 (ite (= rst__AT28 #b1) #b00000000 (ite (= (bvand (bvand start__AT28 ((_ extract 0 0) push__AT28)) (bvnot sb.ff_en.Q__AT28)) #b1) ((_ extract 7 0) flat_data_in__AT28) sb.ff_magic_packet.Q__AT28))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT29 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop29 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en2_prop29 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en3_prop29 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en4_prop29 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en5_prop29 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en6_prop29 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en7_prop29 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en8_prop29 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en9_prop29 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en10_prop29 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en11_prop29 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en12_prop29 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en13_prop29 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en14_prop29 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en15_prop29 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en16_prop29 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en17_prop29 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en18_prop29 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en19_prop29 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en20_prop29 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en21_prop29 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en22_prop29 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en23_prop29 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en24_prop29 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en25_prop29 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en26_prop29 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en27_prop29 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en28_prop29 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(define-fun en29_prop29 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT29 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))

(check-sat-assuming ((not (and en1_prop29 en2_prop29 en3_prop29 en4_prop29 en5_prop29 en6_prop29 en7_prop29 en8_prop29 en9_prop29 en10_prop29 en11_prop29 en12_prop29 en13_prop29 en14_prop29 en15_prop29 en16_prop29 en17_prop29 en18_prop29 en19_prop29 en20_prop29 en21_prop29 en22_prop29 en23_prop29 en24_prop29 en25_prop29 en26_prop29 en27_prop29 en28_prop29 en29_prop29))))



(echo "Checking property at bound 29")

(check-sat)

(pop 1)
(declare-fun N25__AT30 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT30| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT30| () (_ BitVec 4))
(declare-fun rst__AT30 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT30| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT30 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT30| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT30| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT30| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT30 () (_ BitVec 1))
(declare-fun data_out__AT30 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT30| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT30| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT30| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT30| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT30| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT30| () (_ BitVec 4))
(declare-fun prop_signal__AT30 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT30| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT30 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT30| () (_ BitVec 1))
(declare-fun flat_data_in__AT29 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT30| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT30 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT30| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT30 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT30| () (_ BitVec 8))
(declare-fun start__AT30 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT30| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT30 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT30 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT30 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT30| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT30 () (_ BitVec 8))
(declare-fun push__AT30 () (_ BitVec 2))
(declare-fun pop__AT30 () (_ BitVec 2))
(declare-fun full__AT30 () (_ BitVec 2))
(declare-fun data_out_vld__AT30 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT30| () (_ BitVec 8))
(declare-fun af.gnt__AT30 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT30| () (_ BitVec 4))
(declare-fun reqs__AT30 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT30| () (_ BitVec 4))
(declare-fun empty__AT30 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT30)) (bvnot ((_ extract 1 1) push__AT30))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT30)) (bvnot ((_ extract 0 0) push__AT30))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT30)) (bvnot ((_ extract 0 0) reqs__AT30))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT30)) (bvnot ((_ extract 1 1) reqs__AT30))) #b1))
(assert true)
(assert (= prop_signal__AT30 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT30 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT30 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) #b0000)) ((_ extract 0 0) N25__AT30))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT30 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|)) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) ((_ extract 1 1) N25__AT30))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|)) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) ((_ extract 0 0) N25__AT30))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT30 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))))))
(assert (= sb.mpt.ff_cnt.en__AT30 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT30) ((_ extract 0 0) N25__AT30)) rst__AT30) sb.ff_en.Q__AT30))))
(assert (= sb.mpt.ff_cnt.D__AT30 ((_ zero_extend 0) (ite (= rst__AT30 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) #b0000)) ((_ extract 0 0) N25__AT30))))))))
(assert (= sb.ff_magic_packet.en__AT30 ((_ zero_extend 0) (bvand (bvand start__AT30 ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))))
(assert (= sb.ff_en.en__AT30 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT30))))
(assert (= sb.ff_en.D__AT30 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT30 (bvand start__AT30 ((_ extract 0 0) push__AT30))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT30 #b00)) (bvnot (bvnot (bvcomp N25__AT30 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT30 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT30 reqs__AT30)) ((_ extract 1 1) (bvand N25__AT30 reqs__AT30))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT30 #b00))) (bvand (bvnot (bvcomp N25__AT30 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT30) (bvsub ((_ zero_extend 30) N25__AT30) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT30 ((_ zero_extend 0) N25__AT30)))
(assert (= data_out_vld__AT30 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT30 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT30 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) #b0000)) ((_ extract 0 0) N25__AT30))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT30| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|)) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) ((_ extract 0 0) N25__AT30))))))))))))
(assert (= af.gnt__AT30 ((_ zero_extend 0) N25__AT30)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT30| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT30| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|)))
(assert (= full__AT30 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|)))))))
(assert (= |af.gen_fifos[1].f.full__AT30| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT30| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT30| (concat #b000 ((_ extract 1 1) push__AT30))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT30| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT30| (concat #b000 ((_ extract 1 1) N25__AT30))))))
(assert (= empty__AT30 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT30| |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT30| |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|))))
(assert (= |af.gen_fifos[1].f.empty__AT30| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT30| |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT30| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT30) ((_ extract 1 1) N25__AT30)) rst__AT30))))
(assert (= data_out__AT30 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|)) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) (concat ((_ extract 1 1) N25__AT30) ((_ extract 1 1) N25__AT30))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|)) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) (concat ((_ extract 0 0) N25__AT30) ((_ extract 0 0) N25__AT30))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT30| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT30| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|)))
(assert (= |af.gen_fifos[0].f.full__AT30| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT30| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| (concat #b000 ((_ extract 0 0) push__AT30))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT30| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT30| (concat #b000 ((_ extract 0 0) N25__AT30))))))
(assert (= |af.gen_fifos[0].f.empty__AT30| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT30| |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT30| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT30) ((_ extract 0 0) N25__AT30)) rst__AT30))))
(assert (= |af.fifo_data_out[1]__AT30| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|)))))
(assert (= |af.fifo_data_out[0]__AT30| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|)))))
(assert (= rst__AT30 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT30 (ite (= rst__AT29 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT29) ((_ extract 0 0) N25__AT29)) rst__AT29) sb.ff_en.Q__AT29) #b1) (ite (= rst__AT29 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT29 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT29 #b1000)) ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)))) #b0000)) ((_ extract 0 0) N25__AT29))))) sb.mpt.ff_cnt.Q__AT29))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT30| (ite (= rst__AT29 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT29) ((_ extract 0 0) N25__AT29)) rst__AT29) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT29| (concat #b000 ((_ extract 0 0) N25__AT29))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT29|))))
(assert (= sb.ff_en.Q__AT30 (ite (= rst__AT29 #b1) #b0 (ite (= sb.ff_en.Q__AT29 #b1) #b1 (bvor sb.ff_en.Q__AT29 (bvand start__AT29 ((_ extract 0 0) push__AT29)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| (ite (= rst__AT29 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT29) ((_ extract 0 0) N25__AT29)) rst__AT29) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| (concat #b000 ((_ extract 0 0) push__AT29))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT30| (ite (= rst__AT29 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT29) ((_ extract 1 1) N25__AT29)) rst__AT29) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT29| (concat #b000 ((_ extract 1 1) N25__AT29))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT29|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT30| (ite (= rst__AT29 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT29) ((_ extract 1 1) N25__AT29)) rst__AT29) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT29| (concat #b000 ((_ extract 1 1) push__AT29))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|))))
(assert (= |af.gen_fifos[1].f.entries__AT30| (store |af.gen_fifos[1].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|) (bvor (bvand (concat ((_ extract 1 1) push__AT29) (concat ((_ extract 1 1) push__AT29) (concat ((_ extract 1 1) push__AT29) (concat ((_ extract 1 1) push__AT29) (concat ((_ extract 1 1) push__AT29) (concat ((_ extract 1 1) push__AT29) (concat ((_ extract 1 1) push__AT29) ((_ extract 1 1) push__AT29)))))))) ((_ extract 15 8) flat_data_in__AT29)) (bvand (concat (bvnot ((_ extract 1 1) push__AT29)) (concat (bvnot ((_ extract 1 1) push__AT29)) (concat (bvnot ((_ extract 1 1) push__AT29)) (concat (bvnot ((_ extract 1 1) push__AT29)) (concat (bvnot ((_ extract 1 1) push__AT29)) (concat (bvnot ((_ extract 1 1) push__AT29)) (concat (bvnot ((_ extract 1 1) push__AT29)) (bvnot ((_ extract 1 1) push__AT29))))))))) (select |af.gen_fifos[1].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT29|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT30| (store |af.gen_fifos[0].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|) (bvor (bvand (concat ((_ extract 0 0) push__AT29) (concat ((_ extract 0 0) push__AT29) (concat ((_ extract 0 0) push__AT29) (concat ((_ extract 0 0) push__AT29) (concat ((_ extract 0 0) push__AT29) (concat ((_ extract 0 0) push__AT29) (concat ((_ extract 0 0) push__AT29) ((_ extract 0 0) push__AT29)))))))) ((_ extract 7 0) flat_data_in__AT29)) (bvand (concat (bvnot ((_ extract 0 0) push__AT29)) (concat (bvnot ((_ extract 0 0) push__AT29)) (concat (bvnot ((_ extract 0 0) push__AT29)) (concat (bvnot ((_ extract 0 0) push__AT29)) (concat (bvnot ((_ extract 0 0) push__AT29)) (concat (bvnot ((_ extract 0 0) push__AT29)) (concat (bvnot ((_ extract 0 0) push__AT29)) (bvnot ((_ extract 0 0) push__AT29))))))))) (select |af.gen_fifos[0].f.entries__AT29| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT29|)))))))
(assert (= sb.ff_magic_packet.Q__AT30 (ite (= rst__AT29 #b1) #b00000000 (ite (= (bvand (bvand start__AT29 ((_ extract 0 0) push__AT29)) (bvnot sb.ff_en.Q__AT29)) #b1) ((_ extract 7 0) flat_data_in__AT29) sb.ff_magic_packet.Q__AT29))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT30 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop30 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en2_prop30 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en3_prop30 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en4_prop30 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en5_prop30 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en6_prop30 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en7_prop30 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en8_prop30 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en9_prop30 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en10_prop30 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en11_prop30 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en12_prop30 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en13_prop30 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en14_prop30 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en15_prop30 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en16_prop30 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en17_prop30 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en18_prop30 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en19_prop30 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en20_prop30 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en21_prop30 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en22_prop30 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en23_prop30 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en24_prop30 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en25_prop30 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en26_prop30 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en27_prop30 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en28_prop30 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en29_prop30 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(define-fun en30_prop30 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT30 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))

(check-sat-assuming ((not (and en1_prop30 en2_prop30 en3_prop30 en4_prop30 en5_prop30 en6_prop30 en7_prop30 en8_prop30 en9_prop30 en10_prop30 en11_prop30 en12_prop30 en13_prop30 en14_prop30 en15_prop30 en16_prop30 en17_prop30 en18_prop30 en19_prop30 en20_prop30 en21_prop30 en22_prop30 en23_prop30 en24_prop30 en25_prop30 en26_prop30 en27_prop30 en28_prop30 en29_prop30 en30_prop30))))



(echo "Checking property at bound 30")

(check-sat)

(pop 1)
(declare-fun start__AT31 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT31| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT31 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT31 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT31 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT31| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT31 () (_ BitVec 8))
(declare-fun push__AT31 () (_ BitVec 2))
(declare-fun pop__AT31 () (_ BitVec 2))
(declare-fun full__AT31 () (_ BitVec 2))
(declare-fun data_out_vld__AT31 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT31| () (_ BitVec 8))
(declare-fun af.gnt__AT31 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT31| () (_ BitVec 4))
(declare-fun reqs__AT31 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT31| () (_ BitVec 4))
(declare-fun empty__AT31 () (_ BitVec 2))
(declare-fun N25__AT31 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT31| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT31| () (_ BitVec 4))
(declare-fun rst__AT31 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT31| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT31 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT31| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT31| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT31| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT31 () (_ BitVec 1))
(declare-fun data_out__AT31 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT31| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT31| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT31| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT31| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT31| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT31| () (_ BitVec 4))
(declare-fun prop_signal__AT31 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT31| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT31 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT31| () (_ BitVec 1))
(declare-fun flat_data_in__AT30 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT31| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT31 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT31| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT31 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT31| () (_ BitVec 8))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT31)) (bvnot ((_ extract 1 1) push__AT31))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT31)) (bvnot ((_ extract 0 0) push__AT31))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT31)) (bvnot ((_ extract 0 0) reqs__AT31))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT31)) (bvnot ((_ extract 1 1) reqs__AT31))) #b1))
(assert true)
(assert (= prop_signal__AT31 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT31 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT31 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) #b0000)) ((_ extract 0 0) N25__AT31))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT31 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|)) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) ((_ extract 1 1) N25__AT31))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|)) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) ((_ extract 0 0) N25__AT31))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT31 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))))))
(assert (= sb.mpt.ff_cnt.en__AT31 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT31) ((_ extract 0 0) N25__AT31)) rst__AT31) sb.ff_en.Q__AT31))))
(assert (= sb.mpt.ff_cnt.D__AT31 ((_ zero_extend 0) (ite (= rst__AT31 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) #b0000)) ((_ extract 0 0) N25__AT31))))))))
(assert (= sb.ff_magic_packet.en__AT31 ((_ zero_extend 0) (bvand (bvand start__AT31 ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))))
(assert (= sb.ff_en.en__AT31 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT31))))
(assert (= sb.ff_en.D__AT31 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT31 (bvand start__AT31 ((_ extract 0 0) push__AT31))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT31 #b00)) (bvnot (bvnot (bvcomp N25__AT31 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT31 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT31 reqs__AT31)) ((_ extract 1 1) (bvand N25__AT31 reqs__AT31))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT31 #b00))) (bvand (bvnot (bvcomp N25__AT31 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT31) (bvsub ((_ zero_extend 30) N25__AT31) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT31 ((_ zero_extend 0) N25__AT31)))
(assert (= data_out_vld__AT31 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT31 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT31 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) #b0000)) ((_ extract 0 0) N25__AT31))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT31| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|)) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) ((_ extract 0 0) N25__AT31))))))))))))
(assert (= af.gnt__AT31 ((_ zero_extend 0) N25__AT31)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT31| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT31| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|)))
(assert (= full__AT31 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|)))))))
(assert (= |af.gen_fifos[1].f.full__AT31| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT31| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT31| (concat #b000 ((_ extract 1 1) push__AT31))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT31| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT31| (concat #b000 ((_ extract 1 1) N25__AT31))))))
(assert (= empty__AT31 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT31| |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT31| |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|))))
(assert (= |af.gen_fifos[1].f.empty__AT31| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT31| |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT31| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT31) ((_ extract 1 1) N25__AT31)) rst__AT31))))
(assert (= data_out__AT31 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|)) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) (concat ((_ extract 1 1) N25__AT31) ((_ extract 1 1) N25__AT31))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|)) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) (concat ((_ extract 0 0) N25__AT31) ((_ extract 0 0) N25__AT31))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT31| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT31| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|)))
(assert (= |af.gen_fifos[0].f.full__AT31| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT31| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| (concat #b000 ((_ extract 0 0) push__AT31))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT31| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT31| (concat #b000 ((_ extract 0 0) N25__AT31))))))
(assert (= |af.gen_fifos[0].f.empty__AT31| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT31| |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT31| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT31) ((_ extract 0 0) N25__AT31)) rst__AT31))))
(assert (= |af.fifo_data_out[1]__AT31| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|)))))
(assert (= |af.fifo_data_out[0]__AT31| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|)))))
(assert (= rst__AT31 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT31 (ite (= rst__AT30 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT30) ((_ extract 0 0) N25__AT30)) rst__AT30) sb.ff_en.Q__AT30) #b1) (ite (= rst__AT30 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT30 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT30 #b1000)) ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)))) #b0000)) ((_ extract 0 0) N25__AT30))))) sb.mpt.ff_cnt.Q__AT30))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT31| (ite (= rst__AT30 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT30) ((_ extract 0 0) N25__AT30)) rst__AT30) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT30| (concat #b000 ((_ extract 0 0) N25__AT30))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT30|))))
(assert (= sb.ff_en.Q__AT31 (ite (= rst__AT30 #b1) #b0 (ite (= sb.ff_en.Q__AT30 #b1) #b1 (bvor sb.ff_en.Q__AT30 (bvand start__AT30 ((_ extract 0 0) push__AT30)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| (ite (= rst__AT30 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT30) ((_ extract 0 0) N25__AT30)) rst__AT30) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| (concat #b000 ((_ extract 0 0) push__AT30))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT31| (ite (= rst__AT30 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT30) ((_ extract 1 1) N25__AT30)) rst__AT30) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT30| (concat #b000 ((_ extract 1 1) N25__AT30))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT30|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT31| (ite (= rst__AT30 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT30) ((_ extract 1 1) N25__AT30)) rst__AT30) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT30| (concat #b000 ((_ extract 1 1) push__AT30))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|))))
(assert (= |af.gen_fifos[1].f.entries__AT31| (store |af.gen_fifos[1].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|) (bvor (bvand (concat ((_ extract 1 1) push__AT30) (concat ((_ extract 1 1) push__AT30) (concat ((_ extract 1 1) push__AT30) (concat ((_ extract 1 1) push__AT30) (concat ((_ extract 1 1) push__AT30) (concat ((_ extract 1 1) push__AT30) (concat ((_ extract 1 1) push__AT30) ((_ extract 1 1) push__AT30)))))))) ((_ extract 15 8) flat_data_in__AT30)) (bvand (concat (bvnot ((_ extract 1 1) push__AT30)) (concat (bvnot ((_ extract 1 1) push__AT30)) (concat (bvnot ((_ extract 1 1) push__AT30)) (concat (bvnot ((_ extract 1 1) push__AT30)) (concat (bvnot ((_ extract 1 1) push__AT30)) (concat (bvnot ((_ extract 1 1) push__AT30)) (concat (bvnot ((_ extract 1 1) push__AT30)) (bvnot ((_ extract 1 1) push__AT30))))))))) (select |af.gen_fifos[1].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT30|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT31| (store |af.gen_fifos[0].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|) (bvor (bvand (concat ((_ extract 0 0) push__AT30) (concat ((_ extract 0 0) push__AT30) (concat ((_ extract 0 0) push__AT30) (concat ((_ extract 0 0) push__AT30) (concat ((_ extract 0 0) push__AT30) (concat ((_ extract 0 0) push__AT30) (concat ((_ extract 0 0) push__AT30) ((_ extract 0 0) push__AT30)))))))) ((_ extract 7 0) flat_data_in__AT30)) (bvand (concat (bvnot ((_ extract 0 0) push__AT30)) (concat (bvnot ((_ extract 0 0) push__AT30)) (concat (bvnot ((_ extract 0 0) push__AT30)) (concat (bvnot ((_ extract 0 0) push__AT30)) (concat (bvnot ((_ extract 0 0) push__AT30)) (concat (bvnot ((_ extract 0 0) push__AT30)) (concat (bvnot ((_ extract 0 0) push__AT30)) (bvnot ((_ extract 0 0) push__AT30))))))))) (select |af.gen_fifos[0].f.entries__AT30| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT30|)))))))
(assert (= sb.ff_magic_packet.Q__AT31 (ite (= rst__AT30 #b1) #b00000000 (ite (= (bvand (bvand start__AT30 ((_ extract 0 0) push__AT30)) (bvnot sb.ff_en.Q__AT30)) #b1) ((_ extract 7 0) flat_data_in__AT30) sb.ff_magic_packet.Q__AT30))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT31 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop31 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en2_prop31 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en3_prop31 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en4_prop31 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en5_prop31 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en6_prop31 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en7_prop31 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en8_prop31 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en9_prop31 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en10_prop31 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en11_prop31 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en12_prop31 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en13_prop31 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en14_prop31 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en15_prop31 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en16_prop31 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en17_prop31 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en18_prop31 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en19_prop31 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en20_prop31 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en21_prop31 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en22_prop31 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en23_prop31 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en24_prop31 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en25_prop31 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en26_prop31 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en27_prop31 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en28_prop31 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en29_prop31 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en30_prop31 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(define-fun en31_prop31 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT31 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))

(check-sat-assuming ((not (and en1_prop31 en2_prop31 en3_prop31 en4_prop31 en5_prop31 en6_prop31 en7_prop31 en8_prop31 en9_prop31 en10_prop31 en11_prop31 en12_prop31 en13_prop31 en14_prop31 en15_prop31 en16_prop31 en17_prop31 en18_prop31 en19_prop31 en20_prop31 en21_prop31 en22_prop31 en23_prop31 en24_prop31 en25_prop31 en26_prop31 en27_prop31 en28_prop31 en29_prop31 en30_prop31 en31_prop31))))



(echo "Checking property at bound 31")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.full__AT32| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT32| () (_ BitVec 4))
(declare-fun rst__AT32 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT32| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT32 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT32| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT32| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT32| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT32 () (_ BitVec 1))
(declare-fun data_out__AT32 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT32| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT32| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT32| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT32| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT32| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT32| () (_ BitVec 4))
(declare-fun prop_signal__AT32 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT32| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT32 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT32| () (_ BitVec 1))
(declare-fun flat_data_in__AT31 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT32| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT32 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT32| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT32 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT32| () (_ BitVec 8))
(declare-fun start__AT32 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT32 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT32| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.en__AT32 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT32 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT32| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT32 () (_ BitVec 8))
(declare-fun push__AT32 () (_ BitVec 2))
(declare-fun pop__AT32 () (_ BitVec 2))
(declare-fun full__AT32 () (_ BitVec 2))
(declare-fun data_out_vld__AT32 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT32| () (_ BitVec 8))
(declare-fun af.gnt__AT32 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT32| () (_ BitVec 4))
(declare-fun reqs__AT32 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT32| () (_ BitVec 4))
(declare-fun empty__AT32 () (_ BitVec 2))
(declare-fun N25__AT32 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT32)) (bvnot ((_ extract 1 1) push__AT32))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT32)) (bvnot ((_ extract 0 0) push__AT32))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT32)) (bvnot ((_ extract 0 0) reqs__AT32))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT32)) (bvnot ((_ extract 1 1) reqs__AT32))) #b1))
(assert true)
(assert (= prop_signal__AT32 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT32 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT32 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) #b0000)) ((_ extract 0 0) N25__AT32))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT32 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|)) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) ((_ extract 1 1) N25__AT32))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|)) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) ((_ extract 0 0) N25__AT32))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT32 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))))))
(assert (= sb.mpt.ff_cnt.en__AT32 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT32) ((_ extract 0 0) N25__AT32)) rst__AT32) sb.ff_en.Q__AT32))))
(assert (= sb.mpt.ff_cnt.D__AT32 ((_ zero_extend 0) (ite (= rst__AT32 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) #b0000)) ((_ extract 0 0) N25__AT32))))))))
(assert (= sb.ff_magic_packet.en__AT32 ((_ zero_extend 0) (bvand (bvand start__AT32 ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))))
(assert (= sb.ff_en.en__AT32 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT32))))
(assert (= sb.ff_en.D__AT32 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT32 (bvand start__AT32 ((_ extract 0 0) push__AT32))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT32 #b00)) (bvnot (bvnot (bvcomp N25__AT32 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT32 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT32 reqs__AT32)) ((_ extract 1 1) (bvand N25__AT32 reqs__AT32))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT32 #b00))) (bvand (bvnot (bvcomp N25__AT32 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT32) (bvsub ((_ zero_extend 30) N25__AT32) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT32 ((_ zero_extend 0) N25__AT32)))
(assert (= data_out_vld__AT32 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT32 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT32 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) #b0000)) ((_ extract 0 0) N25__AT32))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT32| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|)) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) ((_ extract 0 0) N25__AT32))))))))))))
(assert (= af.gnt__AT32 ((_ zero_extend 0) N25__AT32)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT32| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT32| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|)))
(assert (= full__AT32 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|)))))))
(assert (= |af.gen_fifos[1].f.full__AT32| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT32| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT32| (concat #b000 ((_ extract 1 1) push__AT32))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT32| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT32| (concat #b000 ((_ extract 1 1) N25__AT32))))))
(assert (= empty__AT32 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT32| |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT32| |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|))))
(assert (= |af.gen_fifos[1].f.empty__AT32| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT32| |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT32| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT32) ((_ extract 1 1) N25__AT32)) rst__AT32))))
(assert (= data_out__AT32 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|)) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) (concat ((_ extract 1 1) N25__AT32) ((_ extract 1 1) N25__AT32))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|)) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) (concat ((_ extract 0 0) N25__AT32) ((_ extract 0 0) N25__AT32))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT32| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT32| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|)))
(assert (= |af.gen_fifos[0].f.full__AT32| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT32| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| (concat #b000 ((_ extract 0 0) push__AT32))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT32| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT32| (concat #b000 ((_ extract 0 0) N25__AT32))))))
(assert (= |af.gen_fifos[0].f.empty__AT32| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT32| |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT32| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT32) ((_ extract 0 0) N25__AT32)) rst__AT32))))
(assert (= |af.fifo_data_out[1]__AT32| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|)))))
(assert (= |af.fifo_data_out[0]__AT32| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|)))))
(assert (= rst__AT32 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT32 (ite (= rst__AT31 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT31) ((_ extract 0 0) N25__AT31)) rst__AT31) sb.ff_en.Q__AT31) #b1) (ite (= rst__AT31 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT31 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT31 #b1000)) ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)))) #b0000)) ((_ extract 0 0) N25__AT31))))) sb.mpt.ff_cnt.Q__AT31))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT32| (ite (= rst__AT31 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT31) ((_ extract 0 0) N25__AT31)) rst__AT31) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT31| (concat #b000 ((_ extract 0 0) N25__AT31))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT31|))))
(assert (= sb.ff_en.Q__AT32 (ite (= rst__AT31 #b1) #b0 (ite (= sb.ff_en.Q__AT31 #b1) #b1 (bvor sb.ff_en.Q__AT31 (bvand start__AT31 ((_ extract 0 0) push__AT31)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| (ite (= rst__AT31 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT31) ((_ extract 0 0) N25__AT31)) rst__AT31) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| (concat #b000 ((_ extract 0 0) push__AT31))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT32| (ite (= rst__AT31 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT31) ((_ extract 1 1) N25__AT31)) rst__AT31) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT31| (concat #b000 ((_ extract 1 1) N25__AT31))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT31|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT32| (ite (= rst__AT31 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT31) ((_ extract 1 1) N25__AT31)) rst__AT31) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT31| (concat #b000 ((_ extract 1 1) push__AT31))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|))))
(assert (= |af.gen_fifos[1].f.entries__AT32| (store |af.gen_fifos[1].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|) (bvor (bvand (concat ((_ extract 1 1) push__AT31) (concat ((_ extract 1 1) push__AT31) (concat ((_ extract 1 1) push__AT31) (concat ((_ extract 1 1) push__AT31) (concat ((_ extract 1 1) push__AT31) (concat ((_ extract 1 1) push__AT31) (concat ((_ extract 1 1) push__AT31) ((_ extract 1 1) push__AT31)))))))) ((_ extract 15 8) flat_data_in__AT31)) (bvand (concat (bvnot ((_ extract 1 1) push__AT31)) (concat (bvnot ((_ extract 1 1) push__AT31)) (concat (bvnot ((_ extract 1 1) push__AT31)) (concat (bvnot ((_ extract 1 1) push__AT31)) (concat (bvnot ((_ extract 1 1) push__AT31)) (concat (bvnot ((_ extract 1 1) push__AT31)) (concat (bvnot ((_ extract 1 1) push__AT31)) (bvnot ((_ extract 1 1) push__AT31))))))))) (select |af.gen_fifos[1].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT31|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT32| (store |af.gen_fifos[0].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|) (bvor (bvand (concat ((_ extract 0 0) push__AT31) (concat ((_ extract 0 0) push__AT31) (concat ((_ extract 0 0) push__AT31) (concat ((_ extract 0 0) push__AT31) (concat ((_ extract 0 0) push__AT31) (concat ((_ extract 0 0) push__AT31) (concat ((_ extract 0 0) push__AT31) ((_ extract 0 0) push__AT31)))))))) ((_ extract 7 0) flat_data_in__AT31)) (bvand (concat (bvnot ((_ extract 0 0) push__AT31)) (concat (bvnot ((_ extract 0 0) push__AT31)) (concat (bvnot ((_ extract 0 0) push__AT31)) (concat (bvnot ((_ extract 0 0) push__AT31)) (concat (bvnot ((_ extract 0 0) push__AT31)) (concat (bvnot ((_ extract 0 0) push__AT31)) (concat (bvnot ((_ extract 0 0) push__AT31)) (bvnot ((_ extract 0 0) push__AT31))))))))) (select |af.gen_fifos[0].f.entries__AT31| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT31|)))))))
(assert (= sb.ff_magic_packet.Q__AT32 (ite (= rst__AT31 #b1) #b00000000 (ite (= (bvand (bvand start__AT31 ((_ extract 0 0) push__AT31)) (bvnot sb.ff_en.Q__AT31)) #b1) ((_ extract 7 0) flat_data_in__AT31) sb.ff_magic_packet.Q__AT31))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT32 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop32 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en2_prop32 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en3_prop32 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en4_prop32 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en5_prop32 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en6_prop32 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en7_prop32 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en8_prop32 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en9_prop32 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en10_prop32 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en11_prop32 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en12_prop32 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en13_prop32 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en14_prop32 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en15_prop32 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en16_prop32 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en17_prop32 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en18_prop32 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en19_prop32 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en20_prop32 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en21_prop32 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en22_prop32 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en23_prop32 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en24_prop32 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en25_prop32 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en26_prop32 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en27_prop32 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en28_prop32 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en29_prop32 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en30_prop32 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en31_prop32 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(define-fun en32_prop32 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT32 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))

(check-sat-assuming ((not (and en1_prop32 en2_prop32 en3_prop32 en4_prop32 en5_prop32 en6_prop32 en7_prop32 en8_prop32 en9_prop32 en10_prop32 en11_prop32 en12_prop32 en13_prop32 en14_prop32 en15_prop32 en16_prop32 en17_prop32 en18_prop32 en19_prop32 en20_prop32 en21_prop32 en22_prop32 en23_prop32 en24_prop32 en25_prop32 en26_prop32 en27_prop32 en28_prop32 en29_prop32 en30_prop32 en31_prop32 en32_prop32))))



(echo "Checking property at bound 32")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[0].f.entries__AT33| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT33 () (_ BitVec 8))
(declare-fun push__AT33 () (_ BitVec 2))
(declare-fun pop__AT33 () (_ BitVec 2))
(declare-fun full__AT33 () (_ BitVec 2))
(declare-fun data_out_vld__AT33 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT33| () (_ BitVec 8))
(declare-fun af.gnt__AT33 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT33| () (_ BitVec 4))
(declare-fun reqs__AT33 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT33| () (_ BitVec 4))
(declare-fun empty__AT33 () (_ BitVec 2))
(declare-fun N25__AT33 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT33| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT33| () (_ BitVec 4))
(declare-fun rst__AT33 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT33| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT33 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT33| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT33| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT33| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT33 () (_ BitVec 1))
(declare-fun data_out__AT33 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT33| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT33| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT33| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT33| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT33| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT33| () (_ BitVec 4))
(declare-fun prop_signal__AT33 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT33| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT33 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT33| () (_ BitVec 1))
(declare-fun flat_data_in__AT32 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT33| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT33 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT33| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT33 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT33| () (_ BitVec 8))
(declare-fun start__AT33 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT33| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT33 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT33 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT33 () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT33)) (bvnot ((_ extract 1 1) push__AT33))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT33)) (bvnot ((_ extract 0 0) push__AT33))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT33)) (bvnot ((_ extract 0 0) reqs__AT33))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT33)) (bvnot ((_ extract 1 1) reqs__AT33))) #b1))
(assert true)
(assert (= prop_signal__AT33 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT33 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT33 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) #b0000)) ((_ extract 0 0) N25__AT33))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT33 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|)) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) ((_ extract 1 1) N25__AT33))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|)) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) ((_ extract 0 0) N25__AT33))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT33 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))))))
(assert (= sb.mpt.ff_cnt.en__AT33 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT33) ((_ extract 0 0) N25__AT33)) rst__AT33) sb.ff_en.Q__AT33))))
(assert (= sb.mpt.ff_cnt.D__AT33 ((_ zero_extend 0) (ite (= rst__AT33 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) #b0000)) ((_ extract 0 0) N25__AT33))))))))
(assert (= sb.ff_magic_packet.en__AT33 ((_ zero_extend 0) (bvand (bvand start__AT33 ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))))
(assert (= sb.ff_en.en__AT33 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT33))))
(assert (= sb.ff_en.D__AT33 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT33 (bvand start__AT33 ((_ extract 0 0) push__AT33))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT33 #b00)) (bvnot (bvnot (bvcomp N25__AT33 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT33 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT33 reqs__AT33)) ((_ extract 1 1) (bvand N25__AT33 reqs__AT33))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT33 #b00))) (bvand (bvnot (bvcomp N25__AT33 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT33) (bvsub ((_ zero_extend 30) N25__AT33) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT33 ((_ zero_extend 0) N25__AT33)))
(assert (= data_out_vld__AT33 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT33 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT33 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) #b0000)) ((_ extract 0 0) N25__AT33))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT33| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|)) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) ((_ extract 0 0) N25__AT33))))))))))))
(assert (= af.gnt__AT33 ((_ zero_extend 0) N25__AT33)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT33| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT33| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|)))
(assert (= full__AT33 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|)))))))
(assert (= |af.gen_fifos[1].f.full__AT33| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT33| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT33| (concat #b000 ((_ extract 1 1) push__AT33))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT33| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT33| (concat #b000 ((_ extract 1 1) N25__AT33))))))
(assert (= empty__AT33 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT33| |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT33| |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|))))
(assert (= |af.gen_fifos[1].f.empty__AT33| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT33| |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT33| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT33) ((_ extract 1 1) N25__AT33)) rst__AT33))))
(assert (= data_out__AT33 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|)) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) (concat ((_ extract 1 1) N25__AT33) ((_ extract 1 1) N25__AT33))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|)) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) (concat ((_ extract 0 0) N25__AT33) ((_ extract 0 0) N25__AT33))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT33| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT33| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|)))
(assert (= |af.gen_fifos[0].f.full__AT33| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT33| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| (concat #b000 ((_ extract 0 0) push__AT33))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT33| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT33| (concat #b000 ((_ extract 0 0) N25__AT33))))))
(assert (= |af.gen_fifos[0].f.empty__AT33| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT33| |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT33| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT33) ((_ extract 0 0) N25__AT33)) rst__AT33))))
(assert (= |af.fifo_data_out[1]__AT33| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|)))))
(assert (= |af.fifo_data_out[0]__AT33| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|)))))
(assert (= rst__AT33 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT33 (ite (= rst__AT32 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT32) ((_ extract 0 0) N25__AT32)) rst__AT32) sb.ff_en.Q__AT32) #b1) (ite (= rst__AT32 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT32 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT32 #b1000)) ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)))) #b0000)) ((_ extract 0 0) N25__AT32))))) sb.mpt.ff_cnt.Q__AT32))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT33| (ite (= rst__AT32 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT32) ((_ extract 0 0) N25__AT32)) rst__AT32) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT32| (concat #b000 ((_ extract 0 0) N25__AT32))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT32|))))
(assert (= sb.ff_en.Q__AT33 (ite (= rst__AT32 #b1) #b0 (ite (= sb.ff_en.Q__AT32 #b1) #b1 (bvor sb.ff_en.Q__AT32 (bvand start__AT32 ((_ extract 0 0) push__AT32)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| (ite (= rst__AT32 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT32) ((_ extract 0 0) N25__AT32)) rst__AT32) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| (concat #b000 ((_ extract 0 0) push__AT32))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT33| (ite (= rst__AT32 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT32) ((_ extract 1 1) N25__AT32)) rst__AT32) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT32| (concat #b000 ((_ extract 1 1) N25__AT32))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT32|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT33| (ite (= rst__AT32 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT32) ((_ extract 1 1) N25__AT32)) rst__AT32) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT32| (concat #b000 ((_ extract 1 1) push__AT32))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|))))
(assert (= |af.gen_fifos[1].f.entries__AT33| (store |af.gen_fifos[1].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|) (bvor (bvand (concat ((_ extract 1 1) push__AT32) (concat ((_ extract 1 1) push__AT32) (concat ((_ extract 1 1) push__AT32) (concat ((_ extract 1 1) push__AT32) (concat ((_ extract 1 1) push__AT32) (concat ((_ extract 1 1) push__AT32) (concat ((_ extract 1 1) push__AT32) ((_ extract 1 1) push__AT32)))))))) ((_ extract 15 8) flat_data_in__AT32)) (bvand (concat (bvnot ((_ extract 1 1) push__AT32)) (concat (bvnot ((_ extract 1 1) push__AT32)) (concat (bvnot ((_ extract 1 1) push__AT32)) (concat (bvnot ((_ extract 1 1) push__AT32)) (concat (bvnot ((_ extract 1 1) push__AT32)) (concat (bvnot ((_ extract 1 1) push__AT32)) (concat (bvnot ((_ extract 1 1) push__AT32)) (bvnot ((_ extract 1 1) push__AT32))))))))) (select |af.gen_fifos[1].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT32|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT33| (store |af.gen_fifos[0].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|) (bvor (bvand (concat ((_ extract 0 0) push__AT32) (concat ((_ extract 0 0) push__AT32) (concat ((_ extract 0 0) push__AT32) (concat ((_ extract 0 0) push__AT32) (concat ((_ extract 0 0) push__AT32) (concat ((_ extract 0 0) push__AT32) (concat ((_ extract 0 0) push__AT32) ((_ extract 0 0) push__AT32)))))))) ((_ extract 7 0) flat_data_in__AT32)) (bvand (concat (bvnot ((_ extract 0 0) push__AT32)) (concat (bvnot ((_ extract 0 0) push__AT32)) (concat (bvnot ((_ extract 0 0) push__AT32)) (concat (bvnot ((_ extract 0 0) push__AT32)) (concat (bvnot ((_ extract 0 0) push__AT32)) (concat (bvnot ((_ extract 0 0) push__AT32)) (concat (bvnot ((_ extract 0 0) push__AT32)) (bvnot ((_ extract 0 0) push__AT32))))))))) (select |af.gen_fifos[0].f.entries__AT32| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT32|)))))))
(assert (= sb.ff_magic_packet.Q__AT33 (ite (= rst__AT32 #b1) #b00000000 (ite (= (bvand (bvand start__AT32 ((_ extract 0 0) push__AT32)) (bvnot sb.ff_en.Q__AT32)) #b1) ((_ extract 7 0) flat_data_in__AT32) sb.ff_magic_packet.Q__AT32))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT33 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop33 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en2_prop33 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en3_prop33 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en4_prop33 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en5_prop33 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en6_prop33 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en7_prop33 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en8_prop33 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en9_prop33 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en10_prop33 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en11_prop33 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en12_prop33 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en13_prop33 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en14_prop33 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en15_prop33 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en16_prop33 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en17_prop33 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en18_prop33 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en19_prop33 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en20_prop33 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en21_prop33 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en22_prop33 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en23_prop33 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en24_prop33 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en25_prop33 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en26_prop33 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en27_prop33 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en28_prop33 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en29_prop33 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en30_prop33 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en31_prop33 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en32_prop33 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(define-fun en33_prop33 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT33 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))

(check-sat-assuming ((not (and en1_prop33 en2_prop33 en3_prop33 en4_prop33 en5_prop33 en6_prop33 en7_prop33 en8_prop33 en9_prop33 en10_prop33 en11_prop33 en12_prop33 en13_prop33 en14_prop33 en15_prop33 en16_prop33 en17_prop33 en18_prop33 en19_prop33 en20_prop33 en21_prop33 en22_prop33 en23_prop33 en24_prop33 en25_prop33 en26_prop33 en27_prop33 en28_prop33 en29_prop33 en30_prop33 en31_prop33 en32_prop33 en33_prop33))))



(echo "Checking property at bound 33")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.empty__AT34| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT34| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT34| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT34 () (_ BitVec 1))
(declare-fun data_out__AT34 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT34| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT34| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT34| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT34| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT34| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT34| () (_ BitVec 4))
(declare-fun prop_signal__AT34 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT34| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT34 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT34| () (_ BitVec 1))
(declare-fun flat_data_in__AT33 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT34| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT34 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT34| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT34 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT34| () (_ BitVec 8))
(declare-fun start__AT34 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT34| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT34 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT34 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT34 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT34| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT34 () (_ BitVec 8))
(declare-fun push__AT34 () (_ BitVec 2))
(declare-fun pop__AT34 () (_ BitVec 2))
(declare-fun full__AT34 () (_ BitVec 2))
(declare-fun data_out_vld__AT34 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT34| () (_ BitVec 8))
(declare-fun af.gnt__AT34 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT34| () (_ BitVec 4))
(declare-fun reqs__AT34 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT34| () (_ BitVec 4))
(declare-fun empty__AT34 () (_ BitVec 2))
(declare-fun N25__AT34 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT34| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT34| () (_ BitVec 4))
(declare-fun rst__AT34 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT34| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT34 () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT34)) (bvnot ((_ extract 1 1) push__AT34))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT34)) (bvnot ((_ extract 0 0) push__AT34))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT34)) (bvnot ((_ extract 0 0) reqs__AT34))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT34)) (bvnot ((_ extract 1 1) reqs__AT34))) #b1))
(assert true)
(assert (= prop_signal__AT34 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT34 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT34 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) #b0000)) ((_ extract 0 0) N25__AT34))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT34 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|)) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) ((_ extract 1 1) N25__AT34))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|)) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) ((_ extract 0 0) N25__AT34))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT34 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))))))
(assert (= sb.mpt.ff_cnt.en__AT34 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT34) ((_ extract 0 0) N25__AT34)) rst__AT34) sb.ff_en.Q__AT34))))
(assert (= sb.mpt.ff_cnt.D__AT34 ((_ zero_extend 0) (ite (= rst__AT34 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) #b0000)) ((_ extract 0 0) N25__AT34))))))))
(assert (= sb.ff_magic_packet.en__AT34 ((_ zero_extend 0) (bvand (bvand start__AT34 ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))))
(assert (= sb.ff_en.en__AT34 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT34))))
(assert (= sb.ff_en.D__AT34 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT34 (bvand start__AT34 ((_ extract 0 0) push__AT34))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT34 #b00)) (bvnot (bvnot (bvcomp N25__AT34 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT34 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT34 reqs__AT34)) ((_ extract 1 1) (bvand N25__AT34 reqs__AT34))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT34 #b00))) (bvand (bvnot (bvcomp N25__AT34 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT34) (bvsub ((_ zero_extend 30) N25__AT34) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT34 ((_ zero_extend 0) N25__AT34)))
(assert (= data_out_vld__AT34 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT34 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT34 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) #b0000)) ((_ extract 0 0) N25__AT34))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT34| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|)) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) ((_ extract 0 0) N25__AT34))))))))))))
(assert (= af.gnt__AT34 ((_ zero_extend 0) N25__AT34)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT34| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT34| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|)))
(assert (= full__AT34 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|)))))))
(assert (= |af.gen_fifos[1].f.full__AT34| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT34| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT34| (concat #b000 ((_ extract 1 1) push__AT34))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT34| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT34| (concat #b000 ((_ extract 1 1) N25__AT34))))))
(assert (= empty__AT34 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT34| |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT34| |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|))))
(assert (= |af.gen_fifos[1].f.empty__AT34| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT34| |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT34| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT34) ((_ extract 1 1) N25__AT34)) rst__AT34))))
(assert (= data_out__AT34 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|)) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) (concat ((_ extract 1 1) N25__AT34) ((_ extract 1 1) N25__AT34))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|)) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) (concat ((_ extract 0 0) N25__AT34) ((_ extract 0 0) N25__AT34))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT34| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT34| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|)))
(assert (= |af.gen_fifos[0].f.full__AT34| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT34| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| (concat #b000 ((_ extract 0 0) push__AT34))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT34| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT34| (concat #b000 ((_ extract 0 0) N25__AT34))))))
(assert (= |af.gen_fifos[0].f.empty__AT34| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT34| |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT34| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT34) ((_ extract 0 0) N25__AT34)) rst__AT34))))
(assert (= |af.fifo_data_out[1]__AT34| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|)))))
(assert (= |af.fifo_data_out[0]__AT34| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|)))))
(assert (= rst__AT34 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT34 (ite (= rst__AT33 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT33) ((_ extract 0 0) N25__AT33)) rst__AT33) sb.ff_en.Q__AT33) #b1) (ite (= rst__AT33 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT33 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT33 #b1000)) ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)))) #b0000)) ((_ extract 0 0) N25__AT33))))) sb.mpt.ff_cnt.Q__AT33))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT34| (ite (= rst__AT33 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT33) ((_ extract 0 0) N25__AT33)) rst__AT33) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT33| (concat #b000 ((_ extract 0 0) N25__AT33))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT33|))))
(assert (= sb.ff_en.Q__AT34 (ite (= rst__AT33 #b1) #b0 (ite (= sb.ff_en.Q__AT33 #b1) #b1 (bvor sb.ff_en.Q__AT33 (bvand start__AT33 ((_ extract 0 0) push__AT33)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| (ite (= rst__AT33 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT33) ((_ extract 0 0) N25__AT33)) rst__AT33) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| (concat #b000 ((_ extract 0 0) push__AT33))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT34| (ite (= rst__AT33 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT33) ((_ extract 1 1) N25__AT33)) rst__AT33) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT33| (concat #b000 ((_ extract 1 1) N25__AT33))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT33|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT34| (ite (= rst__AT33 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT33) ((_ extract 1 1) N25__AT33)) rst__AT33) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT33| (concat #b000 ((_ extract 1 1) push__AT33))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|))))
(assert (= |af.gen_fifos[1].f.entries__AT34| (store |af.gen_fifos[1].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|) (bvor (bvand (concat ((_ extract 1 1) push__AT33) (concat ((_ extract 1 1) push__AT33) (concat ((_ extract 1 1) push__AT33) (concat ((_ extract 1 1) push__AT33) (concat ((_ extract 1 1) push__AT33) (concat ((_ extract 1 1) push__AT33) (concat ((_ extract 1 1) push__AT33) ((_ extract 1 1) push__AT33)))))))) ((_ extract 15 8) flat_data_in__AT33)) (bvand (concat (bvnot ((_ extract 1 1) push__AT33)) (concat (bvnot ((_ extract 1 1) push__AT33)) (concat (bvnot ((_ extract 1 1) push__AT33)) (concat (bvnot ((_ extract 1 1) push__AT33)) (concat (bvnot ((_ extract 1 1) push__AT33)) (concat (bvnot ((_ extract 1 1) push__AT33)) (concat (bvnot ((_ extract 1 1) push__AT33)) (bvnot ((_ extract 1 1) push__AT33))))))))) (select |af.gen_fifos[1].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT33|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT34| (store |af.gen_fifos[0].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|) (bvor (bvand (concat ((_ extract 0 0) push__AT33) (concat ((_ extract 0 0) push__AT33) (concat ((_ extract 0 0) push__AT33) (concat ((_ extract 0 0) push__AT33) (concat ((_ extract 0 0) push__AT33) (concat ((_ extract 0 0) push__AT33) (concat ((_ extract 0 0) push__AT33) ((_ extract 0 0) push__AT33)))))))) ((_ extract 7 0) flat_data_in__AT33)) (bvand (concat (bvnot ((_ extract 0 0) push__AT33)) (concat (bvnot ((_ extract 0 0) push__AT33)) (concat (bvnot ((_ extract 0 0) push__AT33)) (concat (bvnot ((_ extract 0 0) push__AT33)) (concat (bvnot ((_ extract 0 0) push__AT33)) (concat (bvnot ((_ extract 0 0) push__AT33)) (concat (bvnot ((_ extract 0 0) push__AT33)) (bvnot ((_ extract 0 0) push__AT33))))))))) (select |af.gen_fifos[0].f.entries__AT33| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT33|)))))))
(assert (= sb.ff_magic_packet.Q__AT34 (ite (= rst__AT33 #b1) #b00000000 (ite (= (bvand (bvand start__AT33 ((_ extract 0 0) push__AT33)) (bvnot sb.ff_en.Q__AT33)) #b1) ((_ extract 7 0) flat_data_in__AT33) sb.ff_magic_packet.Q__AT33))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT34 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop34 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en2_prop34 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en3_prop34 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en4_prop34 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en5_prop34 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en6_prop34 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en7_prop34 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en8_prop34 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en9_prop34 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en10_prop34 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en11_prop34 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en12_prop34 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en13_prop34 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en14_prop34 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en15_prop34 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en16_prop34 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en17_prop34 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en18_prop34 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en19_prop34 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en20_prop34 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en21_prop34 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en22_prop34 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en23_prop34 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en24_prop34 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en25_prop34 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en26_prop34 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en27_prop34 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en28_prop34 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en29_prop34 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en30_prop34 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en31_prop34 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en32_prop34 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en33_prop34 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(define-fun en34_prop34 () Bool (=> (and (= sb.ff_en.Q__AT33 #b0) (= sb.ff_en.Q__AT33 #b1)) (or (= data_out_vld__AT34 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))

(check-sat-assuming ((not (and en1_prop34 en2_prop34 en3_prop34 en4_prop34 en5_prop34 en6_prop34 en7_prop34 en8_prop34 en9_prop34 en10_prop34 en11_prop34 en12_prop34 en13_prop34 en14_prop34 en15_prop34 en16_prop34 en17_prop34 en18_prop34 en19_prop34 en20_prop34 en21_prop34 en22_prop34 en23_prop34 en24_prop34 en25_prop34 en26_prop34 en27_prop34 en28_prop34 en29_prop34 en30_prop34 en31_prop34 en32_prop34 en33_prop34 en34_prop34))))



(echo "Checking property at bound 34")

(check-sat)

(pop 1)
(declare-fun push__AT35 () (_ BitVec 2))
(declare-fun pop__AT35 () (_ BitVec 2))
(declare-fun full__AT35 () (_ BitVec 2))
(declare-fun data_out_vld__AT35 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT35| () (_ BitVec 8))
(declare-fun af.gnt__AT35 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT35| () (_ BitVec 4))
(declare-fun reqs__AT35 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT35| () (_ BitVec 4))
(declare-fun empty__AT35 () (_ BitVec 2))
(declare-fun N25__AT35 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT35| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT35| () (_ BitVec 4))
(declare-fun rst__AT35 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT35| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT35 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT35| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT35| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT35| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT35 () (_ BitVec 1))
(declare-fun data_out__AT35 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT35| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT35| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT35| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT35| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT35| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT35| () (_ BitVec 4))
(declare-fun prop_signal__AT35 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT35| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT35 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT35| () (_ BitVec 1))
(declare-fun flat_data_in__AT34 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT35| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT35 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT35| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT35 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT35| () (_ BitVec 8))
(declare-fun start__AT35 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT35| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT35 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT35 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT35 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT35| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT35 () (_ BitVec 8))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT35)) (bvnot ((_ extract 1 1) push__AT35))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT35)) (bvnot ((_ extract 0 0) push__AT35))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT35)) (bvnot ((_ extract 0 0) reqs__AT35))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT35)) (bvnot ((_ extract 1 1) reqs__AT35))) #b1))
(assert true)
(assert (= prop_signal__AT35 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT35 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT35 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) #b0000)) ((_ extract 0 0) N25__AT35))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT35 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|)) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) ((_ extract 1 1) N25__AT35))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|)) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) ((_ extract 0 0) N25__AT35))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT35 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))))))
(assert (= sb.mpt.ff_cnt.en__AT35 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT35) ((_ extract 0 0) N25__AT35)) rst__AT35) sb.ff_en.Q__AT35))))
(assert (= sb.mpt.ff_cnt.D__AT35 ((_ zero_extend 0) (ite (= rst__AT35 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) #b0000)) ((_ extract 0 0) N25__AT35))))))))
(assert (= sb.ff_magic_packet.en__AT35 ((_ zero_extend 0) (bvand (bvand start__AT35 ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))))
(assert (= sb.ff_en.en__AT35 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT35))))
(assert (= sb.ff_en.D__AT35 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT35 (bvand start__AT35 ((_ extract 0 0) push__AT35))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT35 #b00)) (bvnot (bvnot (bvcomp N25__AT35 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT35 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT35 reqs__AT35)) ((_ extract 1 1) (bvand N25__AT35 reqs__AT35))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT35 #b00))) (bvand (bvnot (bvcomp N25__AT35 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT35) (bvsub ((_ zero_extend 30) N25__AT35) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT35 ((_ zero_extend 0) N25__AT35)))
(assert (= data_out_vld__AT35 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT35 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT35 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) #b0000)) ((_ extract 0 0) N25__AT35))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT35| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|)) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) ((_ extract 0 0) N25__AT35))))))))))))
(assert (= af.gnt__AT35 ((_ zero_extend 0) N25__AT35)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT35| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT35| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|)))
(assert (= full__AT35 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|)))))))
(assert (= |af.gen_fifos[1].f.full__AT35| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT35| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT35| (concat #b000 ((_ extract 1 1) push__AT35))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT35| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT35| (concat #b000 ((_ extract 1 1) N25__AT35))))))
(assert (= empty__AT35 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT35| |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT35| |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|))))
(assert (= |af.gen_fifos[1].f.empty__AT35| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT35| |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT35| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT35) ((_ extract 1 1) N25__AT35)) rst__AT35))))
(assert (= data_out__AT35 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|)) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) (concat ((_ extract 1 1) N25__AT35) ((_ extract 1 1) N25__AT35))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|)) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) (concat ((_ extract 0 0) N25__AT35) ((_ extract 0 0) N25__AT35))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT35| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT35| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|)))
(assert (= |af.gen_fifos[0].f.full__AT35| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT35| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| (concat #b000 ((_ extract 0 0) push__AT35))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT35| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT35| (concat #b000 ((_ extract 0 0) N25__AT35))))))
(assert (= |af.gen_fifos[0].f.empty__AT35| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT35| |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT35| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT35) ((_ extract 0 0) N25__AT35)) rst__AT35))))
(assert (= |af.fifo_data_out[1]__AT35| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|)))))
(assert (= |af.fifo_data_out[0]__AT35| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|)))))
(assert (= rst__AT35 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT35 (ite (= rst__AT34 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT34) ((_ extract 0 0) N25__AT34)) rst__AT34) sb.ff_en.Q__AT34) #b1) (ite (= rst__AT34 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT34 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT34 #b1000)) ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)))) #b0000)) ((_ extract 0 0) N25__AT34))))) sb.mpt.ff_cnt.Q__AT34))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT35| (ite (= rst__AT34 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT34) ((_ extract 0 0) N25__AT34)) rst__AT34) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT34| (concat #b000 ((_ extract 0 0) N25__AT34))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT34|))))
(assert (= sb.ff_en.Q__AT35 (ite (= rst__AT34 #b1) #b0 (ite (= sb.ff_en.Q__AT34 #b1) #b1 (bvor sb.ff_en.Q__AT34 (bvand start__AT34 ((_ extract 0 0) push__AT34)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| (ite (= rst__AT34 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT34) ((_ extract 0 0) N25__AT34)) rst__AT34) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| (concat #b000 ((_ extract 0 0) push__AT34))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT35| (ite (= rst__AT34 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT34) ((_ extract 1 1) N25__AT34)) rst__AT34) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT34| (concat #b000 ((_ extract 1 1) N25__AT34))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT34|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT35| (ite (= rst__AT34 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT34) ((_ extract 1 1) N25__AT34)) rst__AT34) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT34| (concat #b000 ((_ extract 1 1) push__AT34))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|))))
(assert (= |af.gen_fifos[1].f.entries__AT35| (store |af.gen_fifos[1].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|) (bvor (bvand (concat ((_ extract 1 1) push__AT34) (concat ((_ extract 1 1) push__AT34) (concat ((_ extract 1 1) push__AT34) (concat ((_ extract 1 1) push__AT34) (concat ((_ extract 1 1) push__AT34) (concat ((_ extract 1 1) push__AT34) (concat ((_ extract 1 1) push__AT34) ((_ extract 1 1) push__AT34)))))))) ((_ extract 15 8) flat_data_in__AT34)) (bvand (concat (bvnot ((_ extract 1 1) push__AT34)) (concat (bvnot ((_ extract 1 1) push__AT34)) (concat (bvnot ((_ extract 1 1) push__AT34)) (concat (bvnot ((_ extract 1 1) push__AT34)) (concat (bvnot ((_ extract 1 1) push__AT34)) (concat (bvnot ((_ extract 1 1) push__AT34)) (concat (bvnot ((_ extract 1 1) push__AT34)) (bvnot ((_ extract 1 1) push__AT34))))))))) (select |af.gen_fifos[1].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT34|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT35| (store |af.gen_fifos[0].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|) (bvor (bvand (concat ((_ extract 0 0) push__AT34) (concat ((_ extract 0 0) push__AT34) (concat ((_ extract 0 0) push__AT34) (concat ((_ extract 0 0) push__AT34) (concat ((_ extract 0 0) push__AT34) (concat ((_ extract 0 0) push__AT34) (concat ((_ extract 0 0) push__AT34) ((_ extract 0 0) push__AT34)))))))) ((_ extract 7 0) flat_data_in__AT34)) (bvand (concat (bvnot ((_ extract 0 0) push__AT34)) (concat (bvnot ((_ extract 0 0) push__AT34)) (concat (bvnot ((_ extract 0 0) push__AT34)) (concat (bvnot ((_ extract 0 0) push__AT34)) (concat (bvnot ((_ extract 0 0) push__AT34)) (concat (bvnot ((_ extract 0 0) push__AT34)) (concat (bvnot ((_ extract 0 0) push__AT34)) (bvnot ((_ extract 0 0) push__AT34))))))))) (select |af.gen_fifos[0].f.entries__AT34| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT34|)))))))
(assert (= sb.ff_magic_packet.Q__AT35 (ite (= rst__AT34 #b1) #b00000000 (ite (= (bvand (bvand start__AT34 ((_ extract 0 0) push__AT34)) (bvnot sb.ff_en.Q__AT34)) #b1) ((_ extract 7 0) flat_data_in__AT34) sb.ff_magic_packet.Q__AT34))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT35 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop35 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en2_prop35 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en3_prop35 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en4_prop35 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en5_prop35 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en6_prop35 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en7_prop35 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en8_prop35 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en9_prop35 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en10_prop35 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en11_prop35 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en12_prop35 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en13_prop35 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en14_prop35 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en15_prop35 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en16_prop35 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en17_prop35 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en18_prop35 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en19_prop35 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en20_prop35 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en21_prop35 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en22_prop35 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en23_prop35 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en24_prop35 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en25_prop35 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en26_prop35 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en27_prop35 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en28_prop35 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en29_prop35 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en30_prop35 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en31_prop35 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en32_prop35 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en33_prop35 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en34_prop35 () Bool (=> (and (= sb.ff_en.Q__AT33 #b0) (= sb.ff_en.Q__AT33 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(define-fun en35_prop35 () Bool (=> (and (= sb.ff_en.Q__AT34 #b0) (= sb.ff_en.Q__AT34 #b1)) (or (= data_out_vld__AT35 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))

(check-sat-assuming ((not (and en1_prop35 en2_prop35 en3_prop35 en4_prop35 en5_prop35 en6_prop35 en7_prop35 en8_prop35 en9_prop35 en10_prop35 en11_prop35 en12_prop35 en13_prop35 en14_prop35 en15_prop35 en16_prop35 en17_prop35 en18_prop35 en19_prop35 en20_prop35 en21_prop35 en22_prop35 en23_prop35 en24_prop35 en25_prop35 en26_prop35 en27_prop35 en28_prop35 en29_prop35 en30_prop35 en31_prop35 en32_prop35 en33_prop35 en34_prop35 en35_prop35))))



(echo "Checking property at bound 35")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT36| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT36| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT36| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT36| () (_ BitVec 4))
(declare-fun prop_signal__AT36 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT36| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT36 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT36| () (_ BitVec 1))
(declare-fun flat_data_in__AT35 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT36| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT36 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT36| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT36 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT36| () (_ BitVec 8))
(declare-fun start__AT36 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT36 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT36| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.en__AT36 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT36 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT36| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT36 () (_ BitVec 8))
(declare-fun push__AT36 () (_ BitVec 2))
(declare-fun pop__AT36 () (_ BitVec 2))
(declare-fun full__AT36 () (_ BitVec 2))
(declare-fun data_out_vld__AT36 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT36| () (_ BitVec 8))
(declare-fun af.gnt__AT36 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT36| () (_ BitVec 4))
(declare-fun reqs__AT36 () (_ BitVec 2))
(declare-fun data_out__AT36 () (_ BitVec 8))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT36| () (_ BitVec 4))
(declare-fun empty__AT36 () (_ BitVec 2))
(declare-fun N25__AT36 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT36| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT36| () (_ BitVec 4))
(declare-fun rst__AT36 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT36| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT36 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT36| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT36| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT36| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT36 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT36| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT36| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT36)) (bvnot ((_ extract 1 1) push__AT36))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT36)) (bvnot ((_ extract 0 0) push__AT36))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT36)) (bvnot ((_ extract 0 0) reqs__AT36))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT36)) (bvnot ((_ extract 1 1) reqs__AT36))) #b1))
(assert true)
(assert (= prop_signal__AT36 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT36 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT36 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) #b0000)) ((_ extract 0 0) N25__AT36))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT36 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|)) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) ((_ extract 1 1) N25__AT36))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|)) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) ((_ extract 0 0) N25__AT36))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT36 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))))))
(assert (= sb.mpt.ff_cnt.en__AT36 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT36) ((_ extract 0 0) N25__AT36)) rst__AT36) sb.ff_en.Q__AT36))))
(assert (= sb.mpt.ff_cnt.D__AT36 ((_ zero_extend 0) (ite (= rst__AT36 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) #b0000)) ((_ extract 0 0) N25__AT36))))))))
(assert (= sb.ff_magic_packet.en__AT36 ((_ zero_extend 0) (bvand (bvand start__AT36 ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))))
(assert (= sb.ff_en.en__AT36 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT36))))
(assert (= sb.ff_en.D__AT36 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT36 (bvand start__AT36 ((_ extract 0 0) push__AT36))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT36 #b00)) (bvnot (bvnot (bvcomp N25__AT36 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT36 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT36 reqs__AT36)) ((_ extract 1 1) (bvand N25__AT36 reqs__AT36))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT36 #b00))) (bvand (bvnot (bvcomp N25__AT36 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT36) (bvsub ((_ zero_extend 30) N25__AT36) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT36 ((_ zero_extend 0) N25__AT36)))
(assert (= data_out_vld__AT36 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT36 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT36 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) #b0000)) ((_ extract 0 0) N25__AT36))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT36| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|)) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) ((_ extract 0 0) N25__AT36))))))))))))
(assert (= af.gnt__AT36 ((_ zero_extend 0) N25__AT36)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT36| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT36| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|)))
(assert (= full__AT36 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|)))))))
(assert (= |af.gen_fifos[1].f.full__AT36| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT36| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT36| (concat #b000 ((_ extract 1 1) push__AT36))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT36| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT36| (concat #b000 ((_ extract 1 1) N25__AT36))))))
(assert (= empty__AT36 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT36| |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT36| |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|))))
(assert (= |af.gen_fifos[1].f.empty__AT36| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT36| |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT36| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT36) ((_ extract 1 1) N25__AT36)) rst__AT36))))
(assert (= data_out__AT36 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|)) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) (concat ((_ extract 1 1) N25__AT36) ((_ extract 1 1) N25__AT36))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|)) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) (concat ((_ extract 0 0) N25__AT36) ((_ extract 0 0) N25__AT36))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT36| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT36| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|)))
(assert (= |af.gen_fifos[0].f.full__AT36| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT36| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| (concat #b000 ((_ extract 0 0) push__AT36))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT36| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT36| (concat #b000 ((_ extract 0 0) N25__AT36))))))
(assert (= |af.gen_fifos[0].f.empty__AT36| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT36| |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT36| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT36) ((_ extract 0 0) N25__AT36)) rst__AT36))))
(assert (= |af.fifo_data_out[1]__AT36| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|)))))
(assert (= |af.fifo_data_out[0]__AT36| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|)))))
(assert (= rst__AT36 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT36 (ite (= rst__AT35 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT35) ((_ extract 0 0) N25__AT35)) rst__AT35) sb.ff_en.Q__AT35) #b1) (ite (= rst__AT35 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT35 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT35 #b1000)) ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)))) #b0000)) ((_ extract 0 0) N25__AT35))))) sb.mpt.ff_cnt.Q__AT35))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT36| (ite (= rst__AT35 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT35) ((_ extract 0 0) N25__AT35)) rst__AT35) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT35| (concat #b000 ((_ extract 0 0) N25__AT35))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT35|))))
(assert (= sb.ff_en.Q__AT36 (ite (= rst__AT35 #b1) #b0 (ite (= sb.ff_en.Q__AT35 #b1) #b1 (bvor sb.ff_en.Q__AT35 (bvand start__AT35 ((_ extract 0 0) push__AT35)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| (ite (= rst__AT35 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT35) ((_ extract 0 0) N25__AT35)) rst__AT35) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| (concat #b000 ((_ extract 0 0) push__AT35))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT36| (ite (= rst__AT35 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT35) ((_ extract 1 1) N25__AT35)) rst__AT35) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT35| (concat #b000 ((_ extract 1 1) N25__AT35))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT35|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT36| (ite (= rst__AT35 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT35) ((_ extract 1 1) N25__AT35)) rst__AT35) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT35| (concat #b000 ((_ extract 1 1) push__AT35))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|))))
(assert (= |af.gen_fifos[1].f.entries__AT36| (store |af.gen_fifos[1].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|) (bvor (bvand (concat ((_ extract 1 1) push__AT35) (concat ((_ extract 1 1) push__AT35) (concat ((_ extract 1 1) push__AT35) (concat ((_ extract 1 1) push__AT35) (concat ((_ extract 1 1) push__AT35) (concat ((_ extract 1 1) push__AT35) (concat ((_ extract 1 1) push__AT35) ((_ extract 1 1) push__AT35)))))))) ((_ extract 15 8) flat_data_in__AT35)) (bvand (concat (bvnot ((_ extract 1 1) push__AT35)) (concat (bvnot ((_ extract 1 1) push__AT35)) (concat (bvnot ((_ extract 1 1) push__AT35)) (concat (bvnot ((_ extract 1 1) push__AT35)) (concat (bvnot ((_ extract 1 1) push__AT35)) (concat (bvnot ((_ extract 1 1) push__AT35)) (concat (bvnot ((_ extract 1 1) push__AT35)) (bvnot ((_ extract 1 1) push__AT35))))))))) (select |af.gen_fifos[1].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT35|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT36| (store |af.gen_fifos[0].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|) (bvor (bvand (concat ((_ extract 0 0) push__AT35) (concat ((_ extract 0 0) push__AT35) (concat ((_ extract 0 0) push__AT35) (concat ((_ extract 0 0) push__AT35) (concat ((_ extract 0 0) push__AT35) (concat ((_ extract 0 0) push__AT35) (concat ((_ extract 0 0) push__AT35) ((_ extract 0 0) push__AT35)))))))) ((_ extract 7 0) flat_data_in__AT35)) (bvand (concat (bvnot ((_ extract 0 0) push__AT35)) (concat (bvnot ((_ extract 0 0) push__AT35)) (concat (bvnot ((_ extract 0 0) push__AT35)) (concat (bvnot ((_ extract 0 0) push__AT35)) (concat (bvnot ((_ extract 0 0) push__AT35)) (concat (bvnot ((_ extract 0 0) push__AT35)) (concat (bvnot ((_ extract 0 0) push__AT35)) (bvnot ((_ extract 0 0) push__AT35))))))))) (select |af.gen_fifos[0].f.entries__AT35| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT35|)))))))
(assert (= sb.ff_magic_packet.Q__AT36 (ite (= rst__AT35 #b1) #b00000000 (ite (= (bvand (bvand start__AT35 ((_ extract 0 0) push__AT35)) (bvnot sb.ff_en.Q__AT35)) #b1) ((_ extract 7 0) flat_data_in__AT35) sb.ff_magic_packet.Q__AT35))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT36 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop36 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en2_prop36 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en3_prop36 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en4_prop36 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en5_prop36 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en6_prop36 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en7_prop36 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en8_prop36 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en9_prop36 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en10_prop36 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en11_prop36 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en12_prop36 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en13_prop36 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en14_prop36 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en15_prop36 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en16_prop36 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en17_prop36 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en18_prop36 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en19_prop36 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en20_prop36 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en21_prop36 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en22_prop36 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en23_prop36 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en24_prop36 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en25_prop36 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en26_prop36 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en27_prop36 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en28_prop36 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en29_prop36 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en30_prop36 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en31_prop36 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en32_prop36 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en33_prop36 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en34_prop36 () Bool (=> (and (= sb.ff_en.Q__AT33 #b0) (= sb.ff_en.Q__AT33 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en35_prop36 () Bool (=> (and (= sb.ff_en.Q__AT34 #b0) (= sb.ff_en.Q__AT34 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(define-fun en36_prop36 () Bool (=> (and (= sb.ff_en.Q__AT35 #b0) (= sb.ff_en.Q__AT35 #b1)) (or (= data_out_vld__AT36 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))

(check-sat-assuming ((not (and en1_prop36 en2_prop36 en3_prop36 en4_prop36 en5_prop36 en6_prop36 en7_prop36 en8_prop36 en9_prop36 en10_prop36 en11_prop36 en12_prop36 en13_prop36 en14_prop36 en15_prop36 en16_prop36 en17_prop36 en18_prop36 en19_prop36 en20_prop36 en21_prop36 en22_prop36 en23_prop36 en24_prop36 en25_prop36 en26_prop36 en27_prop36 en28_prop36 en29_prop36 en30_prop36 en31_prop36 en32_prop36 en33_prop36 en34_prop36 en35_prop36 en36_prop36))))



(echo "Checking property at bound 36")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.wrPtr__AT37| () (_ BitVec 4))
(declare-fun reqs__AT37 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT37| () (_ BitVec 4))
(declare-fun empty__AT37 () (_ BitVec 2))
(declare-fun N25__AT37 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT37| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT37| () (_ BitVec 4))
(declare-fun rst__AT37 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT37| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT37 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT37| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT37| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT37| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT37 () (_ BitVec 1))
(declare-fun data_out__AT37 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT37| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT37| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT37| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT37| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT37| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT37| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT37| () (_ BitVec 4))
(declare-fun prop_signal__AT37 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT37| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT37 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT37| () (_ BitVec 1))
(declare-fun flat_data_in__AT36 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT37| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT37 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT37| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT37 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT37| () (_ BitVec 8))
(declare-fun start__AT37 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT37| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT37 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT37 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT37 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT37| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT37 () (_ BitVec 8))
(declare-fun push__AT37 () (_ BitVec 2))
(declare-fun pop__AT37 () (_ BitVec 2))
(declare-fun full__AT37 () (_ BitVec 2))
(declare-fun data_out_vld__AT37 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT37| () (_ BitVec 8))
(declare-fun af.gnt__AT37 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT37)) (bvnot ((_ extract 1 1) push__AT37))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT37)) (bvnot ((_ extract 0 0) push__AT37))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT37)) (bvnot ((_ extract 0 0) reqs__AT37))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT37)) (bvnot ((_ extract 1 1) reqs__AT37))) #b1))
(assert true)
(assert (= prop_signal__AT37 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT37 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT37 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) #b0000)) ((_ extract 0 0) N25__AT37))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT37 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|)) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) ((_ extract 1 1) N25__AT37))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|)) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) ((_ extract 0 0) N25__AT37))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT37 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))))))
(assert (= sb.mpt.ff_cnt.en__AT37 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT37) ((_ extract 0 0) N25__AT37)) rst__AT37) sb.ff_en.Q__AT37))))
(assert (= sb.mpt.ff_cnt.D__AT37 ((_ zero_extend 0) (ite (= rst__AT37 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) #b0000)) ((_ extract 0 0) N25__AT37))))))))
(assert (= sb.ff_magic_packet.en__AT37 ((_ zero_extend 0) (bvand (bvand start__AT37 ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))))
(assert (= sb.ff_en.en__AT37 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT37))))
(assert (= sb.ff_en.D__AT37 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT37 (bvand start__AT37 ((_ extract 0 0) push__AT37))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT37 #b00)) (bvnot (bvnot (bvcomp N25__AT37 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT37 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT37 reqs__AT37)) ((_ extract 1 1) (bvand N25__AT37 reqs__AT37))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT37 #b00))) (bvand (bvnot (bvcomp N25__AT37 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT37) (bvsub ((_ zero_extend 30) N25__AT37) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT37 ((_ zero_extend 0) N25__AT37)))
(assert (= data_out_vld__AT37 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT37 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT37 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) #b0000)) ((_ extract 0 0) N25__AT37))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT37| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|)) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) ((_ extract 0 0) N25__AT37))))))))))))
(assert (= af.gnt__AT37 ((_ zero_extend 0) N25__AT37)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT37| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT37| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|)))
(assert (= full__AT37 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|)))))))
(assert (= |af.gen_fifos[1].f.full__AT37| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT37| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT37| (concat #b000 ((_ extract 1 1) push__AT37))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT37| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT37| (concat #b000 ((_ extract 1 1) N25__AT37))))))
(assert (= empty__AT37 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT37| |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT37| |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|))))
(assert (= |af.gen_fifos[1].f.empty__AT37| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT37| |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT37| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT37) ((_ extract 1 1) N25__AT37)) rst__AT37))))
(assert (= data_out__AT37 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|)) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) (concat ((_ extract 1 1) N25__AT37) ((_ extract 1 1) N25__AT37))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|)) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) (concat ((_ extract 0 0) N25__AT37) ((_ extract 0 0) N25__AT37))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT37| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT37| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|)))
(assert (= |af.gen_fifos[0].f.full__AT37| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT37| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT37| (concat #b000 ((_ extract 0 0) push__AT37))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT37| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT37| (concat #b000 ((_ extract 0 0) N25__AT37))))))
(assert (= |af.gen_fifos[0].f.empty__AT37| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT37| |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT37| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT37) ((_ extract 0 0) N25__AT37)) rst__AT37))))
(assert (= |af.fifo_data_out[1]__AT37| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|)))))
(assert (= |af.fifo_data_out[0]__AT37| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|)))))
(assert (= rst__AT37 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT37 (ite (= rst__AT36 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT36) ((_ extract 0 0) N25__AT36)) rst__AT36) sb.ff_en.Q__AT36) #b1) (ite (= rst__AT36 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT36 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT36 #b1000)) ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)))) #b0000)) ((_ extract 0 0) N25__AT36))))) sb.mpt.ff_cnt.Q__AT36))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT37| (ite (= rst__AT36 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT36) ((_ extract 0 0) N25__AT36)) rst__AT36) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT36| (concat #b000 ((_ extract 0 0) N25__AT36))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT36|))))
(assert (= sb.ff_en.Q__AT37 (ite (= rst__AT36 #b1) #b0 (ite (= sb.ff_en.Q__AT36 #b1) #b1 (bvor sb.ff_en.Q__AT36 (bvand start__AT36 ((_ extract 0 0) push__AT36)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT37| (ite (= rst__AT36 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT36) ((_ extract 0 0) N25__AT36)) rst__AT36) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| (concat #b000 ((_ extract 0 0) push__AT36))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT37| (ite (= rst__AT36 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT36) ((_ extract 1 1) N25__AT36)) rst__AT36) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT36| (concat #b000 ((_ extract 1 1) N25__AT36))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT36|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT37| (ite (= rst__AT36 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT36) ((_ extract 1 1) N25__AT36)) rst__AT36) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT36| (concat #b000 ((_ extract 1 1) push__AT36))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|))))
(assert (= |af.gen_fifos[1].f.entries__AT37| (store |af.gen_fifos[1].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|) (bvor (bvand (concat ((_ extract 1 1) push__AT36) (concat ((_ extract 1 1) push__AT36) (concat ((_ extract 1 1) push__AT36) (concat ((_ extract 1 1) push__AT36) (concat ((_ extract 1 1) push__AT36) (concat ((_ extract 1 1) push__AT36) (concat ((_ extract 1 1) push__AT36) ((_ extract 1 1) push__AT36)))))))) ((_ extract 15 8) flat_data_in__AT36)) (bvand (concat (bvnot ((_ extract 1 1) push__AT36)) (concat (bvnot ((_ extract 1 1) push__AT36)) (concat (bvnot ((_ extract 1 1) push__AT36)) (concat (bvnot ((_ extract 1 1) push__AT36)) (concat (bvnot ((_ extract 1 1) push__AT36)) (concat (bvnot ((_ extract 1 1) push__AT36)) (concat (bvnot ((_ extract 1 1) push__AT36)) (bvnot ((_ extract 1 1) push__AT36))))))))) (select |af.gen_fifos[1].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT36|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT37| (store |af.gen_fifos[0].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|) (bvor (bvand (concat ((_ extract 0 0) push__AT36) (concat ((_ extract 0 0) push__AT36) (concat ((_ extract 0 0) push__AT36) (concat ((_ extract 0 0) push__AT36) (concat ((_ extract 0 0) push__AT36) (concat ((_ extract 0 0) push__AT36) (concat ((_ extract 0 0) push__AT36) ((_ extract 0 0) push__AT36)))))))) ((_ extract 7 0) flat_data_in__AT36)) (bvand (concat (bvnot ((_ extract 0 0) push__AT36)) (concat (bvnot ((_ extract 0 0) push__AT36)) (concat (bvnot ((_ extract 0 0) push__AT36)) (concat (bvnot ((_ extract 0 0) push__AT36)) (concat (bvnot ((_ extract 0 0) push__AT36)) (concat (bvnot ((_ extract 0 0) push__AT36)) (concat (bvnot ((_ extract 0 0) push__AT36)) (bvnot ((_ extract 0 0) push__AT36))))))))) (select |af.gen_fifos[0].f.entries__AT36| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT36|)))))))
(assert (= sb.ff_magic_packet.Q__AT37 (ite (= rst__AT36 #b1) #b00000000 (ite (= (bvand (bvand start__AT36 ((_ extract 0 0) push__AT36)) (bvnot sb.ff_en.Q__AT36)) #b1) ((_ extract 7 0) flat_data_in__AT36) sb.ff_magic_packet.Q__AT36))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT37 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop37 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en2_prop37 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en3_prop37 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en4_prop37 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en5_prop37 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en6_prop37 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en7_prop37 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en8_prop37 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en9_prop37 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en10_prop37 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en11_prop37 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en12_prop37 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en13_prop37 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en14_prop37 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en15_prop37 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en16_prop37 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en17_prop37 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en18_prop37 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en19_prop37 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en20_prop37 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en21_prop37 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en22_prop37 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en23_prop37 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en24_prop37 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en25_prop37 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en26_prop37 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en27_prop37 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en28_prop37 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en29_prop37 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en30_prop37 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en31_prop37 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en32_prop37 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en33_prop37 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en34_prop37 () Bool (=> (and (= sb.ff_en.Q__AT33 #b0) (= sb.ff_en.Q__AT33 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en35_prop37 () Bool (=> (and (= sb.ff_en.Q__AT34 #b0) (= sb.ff_en.Q__AT34 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en36_prop37 () Bool (=> (and (= sb.ff_en.Q__AT35 #b0) (= sb.ff_en.Q__AT35 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(define-fun en37_prop37 () Bool (=> (and (= sb.ff_en.Q__AT36 #b0) (= sb.ff_en.Q__AT36 #b1)) (or (= data_out_vld__AT37 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))

(check-sat-assuming ((not (and en1_prop37 en2_prop37 en3_prop37 en4_prop37 en5_prop37 en6_prop37 en7_prop37 en8_prop37 en9_prop37 en10_prop37 en11_prop37 en12_prop37 en13_prop37 en14_prop37 en15_prop37 en16_prop37 en17_prop37 en18_prop37 en19_prop37 en20_prop37 en21_prop37 en22_prop37 en23_prop37 en24_prop37 en25_prop37 en26_prop37 en27_prop37 en28_prop37 en29_prop37 en30_prop37 en31_prop37 en32_prop37 en33_prop37 en34_prop37 en35_prop37 en36_prop37 en37_prop37))))



(echo "Checking property at bound 37")

(check-sat)

(pop 1)
(declare-fun flat_data_in__AT37 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT38| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT38 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT38| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT38 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT38| () (_ BitVec 8))
(declare-fun start__AT38 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT38| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT38 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT38 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT38 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT38| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT38 () (_ BitVec 8))
(declare-fun push__AT38 () (_ BitVec 2))
(declare-fun pop__AT38 () (_ BitVec 2))
(declare-fun full__AT38 () (_ BitVec 2))
(declare-fun data_out_vld__AT38 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT38| () (_ BitVec 8))
(declare-fun af.gnt__AT38 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT38| () (_ BitVec 4))
(declare-fun reqs__AT38 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT38| () (_ BitVec 4))
(declare-fun empty__AT38 () (_ BitVec 2))
(declare-fun N25__AT38 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT38| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT38| () (_ BitVec 4))
(declare-fun rst__AT38 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT38| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT38 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT38| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT38| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT38| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT38 () (_ BitVec 1))
(declare-fun data_out__AT38 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT38| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT38| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT38| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT38| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT38| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT38| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT38| () (_ BitVec 4))
(declare-fun prop_signal__AT38 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT38| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT38 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT38| () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT38)) (bvnot ((_ extract 1 1) push__AT38))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT38)) (bvnot ((_ extract 0 0) push__AT38))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT38)) (bvnot ((_ extract 0 0) reqs__AT38))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT38)) (bvnot ((_ extract 1 1) reqs__AT38))) #b1))
(assert true)
(assert (= prop_signal__AT38 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT38 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT38 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) #b0000)) ((_ extract 0 0) N25__AT38))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT38 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|)) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) ((_ extract 1 1) N25__AT38))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|)) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) ((_ extract 0 0) N25__AT38))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT38 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))))))
(assert (= sb.mpt.ff_cnt.en__AT38 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT38) ((_ extract 0 0) N25__AT38)) rst__AT38) sb.ff_en.Q__AT38))))
(assert (= sb.mpt.ff_cnt.D__AT38 ((_ zero_extend 0) (ite (= rst__AT38 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) #b0000)) ((_ extract 0 0) N25__AT38))))))))
(assert (= sb.ff_magic_packet.en__AT38 ((_ zero_extend 0) (bvand (bvand start__AT38 ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))))
(assert (= sb.ff_en.en__AT38 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT38))))
(assert (= sb.ff_en.D__AT38 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT38 (bvand start__AT38 ((_ extract 0 0) push__AT38))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT38 #b00)) (bvnot (bvnot (bvcomp N25__AT38 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT38 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT38 reqs__AT38)) ((_ extract 1 1) (bvand N25__AT38 reqs__AT38))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT38 #b00))) (bvand (bvnot (bvcomp N25__AT38 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT38) (bvsub ((_ zero_extend 30) N25__AT38) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT38 ((_ zero_extend 0) N25__AT38)))
(assert (= data_out_vld__AT38 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT38 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT38 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) #b0000)) ((_ extract 0 0) N25__AT38))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT38| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|)) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) ((_ extract 0 0) N25__AT38))))))))))))
(assert (= af.gnt__AT38 ((_ zero_extend 0) N25__AT38)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT38| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT38| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|)))
(assert (= full__AT38 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|)))))))
(assert (= |af.gen_fifos[1].f.full__AT38| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT38| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT38| (concat #b000 ((_ extract 1 1) push__AT38))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT38| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT38| (concat #b000 ((_ extract 1 1) N25__AT38))))))
(assert (= empty__AT38 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT38| |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT38| |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|))))
(assert (= |af.gen_fifos[1].f.empty__AT38| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT38| |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT38| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT38) ((_ extract 1 1) N25__AT38)) rst__AT38))))
(assert (= data_out__AT38 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|)) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) (concat ((_ extract 1 1) N25__AT38) ((_ extract 1 1) N25__AT38))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|)) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) (concat ((_ extract 0 0) N25__AT38) ((_ extract 0 0) N25__AT38))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT38| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT38| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|)))
(assert (= |af.gen_fifos[0].f.full__AT38| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT38| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT38| (concat #b000 ((_ extract 0 0) push__AT38))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT38| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT38| (concat #b000 ((_ extract 0 0) N25__AT38))))))
(assert (= |af.gen_fifos[0].f.empty__AT38| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT38| |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT38| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT38) ((_ extract 0 0) N25__AT38)) rst__AT38))))
(assert (= |af.fifo_data_out[1]__AT38| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|)))))
(assert (= |af.fifo_data_out[0]__AT38| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|)))))
(assert (= rst__AT38 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT38 (ite (= rst__AT37 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT37) ((_ extract 0 0) N25__AT37)) rst__AT37) sb.ff_en.Q__AT37) #b1) (ite (= rst__AT37 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT37 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT37 #b1000)) ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)))) #b0000)) ((_ extract 0 0) N25__AT37))))) sb.mpt.ff_cnt.Q__AT37))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT38| (ite (= rst__AT37 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT37) ((_ extract 0 0) N25__AT37)) rst__AT37) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT37| (concat #b000 ((_ extract 0 0) N25__AT37))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT37|))))
(assert (= sb.ff_en.Q__AT38 (ite (= rst__AT37 #b1) #b0 (ite (= sb.ff_en.Q__AT37 #b1) #b1 (bvor sb.ff_en.Q__AT37 (bvand start__AT37 ((_ extract 0 0) push__AT37)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT38| (ite (= rst__AT37 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT37) ((_ extract 0 0) N25__AT37)) rst__AT37) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT37| (concat #b000 ((_ extract 0 0) push__AT37))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT38| (ite (= rst__AT37 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT37) ((_ extract 1 1) N25__AT37)) rst__AT37) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT37| (concat #b000 ((_ extract 1 1) N25__AT37))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT37|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT38| (ite (= rst__AT37 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT37) ((_ extract 1 1) N25__AT37)) rst__AT37) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT37| (concat #b000 ((_ extract 1 1) push__AT37))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|))))
(assert (= |af.gen_fifos[1].f.entries__AT38| (store |af.gen_fifos[1].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|) (bvor (bvand (concat ((_ extract 1 1) push__AT37) (concat ((_ extract 1 1) push__AT37) (concat ((_ extract 1 1) push__AT37) (concat ((_ extract 1 1) push__AT37) (concat ((_ extract 1 1) push__AT37) (concat ((_ extract 1 1) push__AT37) (concat ((_ extract 1 1) push__AT37) ((_ extract 1 1) push__AT37)))))))) ((_ extract 15 8) flat_data_in__AT37)) (bvand (concat (bvnot ((_ extract 1 1) push__AT37)) (concat (bvnot ((_ extract 1 1) push__AT37)) (concat (bvnot ((_ extract 1 1) push__AT37)) (concat (bvnot ((_ extract 1 1) push__AT37)) (concat (bvnot ((_ extract 1 1) push__AT37)) (concat (bvnot ((_ extract 1 1) push__AT37)) (concat (bvnot ((_ extract 1 1) push__AT37)) (bvnot ((_ extract 1 1) push__AT37))))))))) (select |af.gen_fifos[1].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT37|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT38| (store |af.gen_fifos[0].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|) (bvor (bvand (concat ((_ extract 0 0) push__AT37) (concat ((_ extract 0 0) push__AT37) (concat ((_ extract 0 0) push__AT37) (concat ((_ extract 0 0) push__AT37) (concat ((_ extract 0 0) push__AT37) (concat ((_ extract 0 0) push__AT37) (concat ((_ extract 0 0) push__AT37) ((_ extract 0 0) push__AT37)))))))) ((_ extract 7 0) flat_data_in__AT37)) (bvand (concat (bvnot ((_ extract 0 0) push__AT37)) (concat (bvnot ((_ extract 0 0) push__AT37)) (concat (bvnot ((_ extract 0 0) push__AT37)) (concat (bvnot ((_ extract 0 0) push__AT37)) (concat (bvnot ((_ extract 0 0) push__AT37)) (concat (bvnot ((_ extract 0 0) push__AT37)) (concat (bvnot ((_ extract 0 0) push__AT37)) (bvnot ((_ extract 0 0) push__AT37))))))))) (select |af.gen_fifos[0].f.entries__AT37| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT37|)))))))
(assert (= sb.ff_magic_packet.Q__AT38 (ite (= rst__AT37 #b1) #b00000000 (ite (= (bvand (bvand start__AT37 ((_ extract 0 0) push__AT37)) (bvnot sb.ff_en.Q__AT37)) #b1) ((_ extract 7 0) flat_data_in__AT37) sb.ff_magic_packet.Q__AT37))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT38 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop38 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en2_prop38 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en3_prop38 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en4_prop38 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en5_prop38 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en6_prop38 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en7_prop38 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en8_prop38 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en9_prop38 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en10_prop38 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en11_prop38 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en12_prop38 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en13_prop38 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en14_prop38 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en15_prop38 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en16_prop38 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en17_prop38 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en18_prop38 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en19_prop38 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en20_prop38 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en21_prop38 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en22_prop38 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en23_prop38 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en24_prop38 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en25_prop38 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en26_prop38 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en27_prop38 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en28_prop38 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en29_prop38 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en30_prop38 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en31_prop38 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en32_prop38 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en33_prop38 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en34_prop38 () Bool (=> (and (= sb.ff_en.Q__AT33 #b0) (= sb.ff_en.Q__AT33 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en35_prop38 () Bool (=> (and (= sb.ff_en.Q__AT34 #b0) (= sb.ff_en.Q__AT34 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en36_prop38 () Bool (=> (and (= sb.ff_en.Q__AT35 #b0) (= sb.ff_en.Q__AT35 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en37_prop38 () Bool (=> (and (= sb.ff_en.Q__AT36 #b0) (= sb.ff_en.Q__AT36 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(define-fun en38_prop38 () Bool (=> (and (= sb.ff_en.Q__AT37 #b0) (= sb.ff_en.Q__AT37 #b1)) (or (= data_out_vld__AT38 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT37| |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))

(check-sat-assuming ((not (and en1_prop38 en2_prop38 en3_prop38 en4_prop38 en5_prop38 en6_prop38 en7_prop38 en8_prop38 en9_prop38 en10_prop38 en11_prop38 en12_prop38 en13_prop38 en14_prop38 en15_prop38 en16_prop38 en17_prop38 en18_prop38 en19_prop38 en20_prop38 en21_prop38 en22_prop38 en23_prop38 en24_prop38 en25_prop38 en26_prop38 en27_prop38 en28_prop38 en29_prop38 en30_prop38 en31_prop38 en32_prop38 en33_prop38 en34_prop38 en35_prop38 en36_prop38 en37_prop38 en38_prop38))))



(echo "Checking property at bound 38")

(check-sat)

(pop 1)
(declare-fun N25__AT39 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT39| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT39| () (_ BitVec 4))
(declare-fun rst__AT39 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT39| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT39 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT39| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT39| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT39| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT39 () (_ BitVec 1))
(declare-fun data_out__AT39 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT39| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT39| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT39| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT39| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT39| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT39| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT39| () (_ BitVec 4))
(declare-fun prop_signal__AT39 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT39| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT39 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT39| () (_ BitVec 1))
(declare-fun flat_data_in__AT38 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT39| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT39 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT39| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT39 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT39| () (_ BitVec 8))
(declare-fun start__AT39 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT39| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT39 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT39 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT39 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT39| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT39 () (_ BitVec 8))
(declare-fun push__AT39 () (_ BitVec 2))
(declare-fun pop__AT39 () (_ BitVec 2))
(declare-fun full__AT39 () (_ BitVec 2))
(declare-fun data_out_vld__AT39 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT39| () (_ BitVec 8))
(declare-fun af.gnt__AT39 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT39| () (_ BitVec 4))
(declare-fun reqs__AT39 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT39| () (_ BitVec 4))
(declare-fun empty__AT39 () (_ BitVec 2))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT39)) (bvnot ((_ extract 1 1) push__AT39))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT39)) (bvnot ((_ extract 0 0) push__AT39))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT39)) (bvnot ((_ extract 0 0) reqs__AT39))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT39)) (bvnot ((_ extract 1 1) reqs__AT39))) #b1))
(assert true)
(assert (= prop_signal__AT39 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT39 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT39 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) #b0000)) ((_ extract 0 0) N25__AT39))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT39 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|)) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) ((_ extract 1 1) N25__AT39))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|)) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) ((_ extract 0 0) N25__AT39))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT39 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))))))
(assert (= sb.mpt.ff_cnt.en__AT39 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT39) ((_ extract 0 0) N25__AT39)) rst__AT39) sb.ff_en.Q__AT39))))
(assert (= sb.mpt.ff_cnt.D__AT39 ((_ zero_extend 0) (ite (= rst__AT39 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) #b0000)) ((_ extract 0 0) N25__AT39))))))))
(assert (= sb.ff_magic_packet.en__AT39 ((_ zero_extend 0) (bvand (bvand start__AT39 ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))))
(assert (= sb.ff_en.en__AT39 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT39))))
(assert (= sb.ff_en.D__AT39 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT39 (bvand start__AT39 ((_ extract 0 0) push__AT39))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT39 #b00)) (bvnot (bvnot (bvcomp N25__AT39 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT39 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT39 reqs__AT39)) ((_ extract 1 1) (bvand N25__AT39 reqs__AT39))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT39 #b00))) (bvand (bvnot (bvcomp N25__AT39 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT39) (bvsub ((_ zero_extend 30) N25__AT39) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT39 ((_ zero_extend 0) N25__AT39)))
(assert (= data_out_vld__AT39 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT39 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT39 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) #b0000)) ((_ extract 0 0) N25__AT39))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT39| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|)) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) ((_ extract 0 0) N25__AT39))))))))))))
(assert (= af.gnt__AT39 ((_ zero_extend 0) N25__AT39)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT39| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT39| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|)))
(assert (= full__AT39 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|)))))))
(assert (= |af.gen_fifos[1].f.full__AT39| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT39| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT39| (concat #b000 ((_ extract 1 1) push__AT39))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT39| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT39| (concat #b000 ((_ extract 1 1) N25__AT39))))))
(assert (= empty__AT39 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT39| |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT39| |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|))))
(assert (= |af.gen_fifos[1].f.empty__AT39| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT39| |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT39| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT39) ((_ extract 1 1) N25__AT39)) rst__AT39))))
(assert (= data_out__AT39 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|)) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) (concat ((_ extract 1 1) N25__AT39) ((_ extract 1 1) N25__AT39))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|)) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) (concat ((_ extract 0 0) N25__AT39) ((_ extract 0 0) N25__AT39))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT39| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT39| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|)))
(assert (= |af.gen_fifos[0].f.full__AT39| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT39| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT39| (concat #b000 ((_ extract 0 0) push__AT39))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT39| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT39| (concat #b000 ((_ extract 0 0) N25__AT39))))))
(assert (= |af.gen_fifos[0].f.empty__AT39| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT39| |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT39| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT39) ((_ extract 0 0) N25__AT39)) rst__AT39))))
(assert (= |af.fifo_data_out[1]__AT39| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|)))))
(assert (= |af.fifo_data_out[0]__AT39| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|)))))
(assert (= rst__AT39 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT39 (ite (= rst__AT38 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT38) ((_ extract 0 0) N25__AT38)) rst__AT38) sb.ff_en.Q__AT38) #b1) (ite (= rst__AT38 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT38 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT38 #b1000)) ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)))) #b0000)) ((_ extract 0 0) N25__AT38))))) sb.mpt.ff_cnt.Q__AT38))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT39| (ite (= rst__AT38 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT38) ((_ extract 0 0) N25__AT38)) rst__AT38) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT38| (concat #b000 ((_ extract 0 0) N25__AT38))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT38|))))
(assert (= sb.ff_en.Q__AT39 (ite (= rst__AT38 #b1) #b0 (ite (= sb.ff_en.Q__AT38 #b1) #b1 (bvor sb.ff_en.Q__AT38 (bvand start__AT38 ((_ extract 0 0) push__AT38)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT39| (ite (= rst__AT38 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT38) ((_ extract 0 0) N25__AT38)) rst__AT38) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT38| (concat #b000 ((_ extract 0 0) push__AT38))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT39| (ite (= rst__AT38 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT38) ((_ extract 1 1) N25__AT38)) rst__AT38) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT38| (concat #b000 ((_ extract 1 1) N25__AT38))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT38|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT39| (ite (= rst__AT38 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT38) ((_ extract 1 1) N25__AT38)) rst__AT38) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT38| (concat #b000 ((_ extract 1 1) push__AT38))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|))))
(assert (= |af.gen_fifos[1].f.entries__AT39| (store |af.gen_fifos[1].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|) (bvor (bvand (concat ((_ extract 1 1) push__AT38) (concat ((_ extract 1 1) push__AT38) (concat ((_ extract 1 1) push__AT38) (concat ((_ extract 1 1) push__AT38) (concat ((_ extract 1 1) push__AT38) (concat ((_ extract 1 1) push__AT38) (concat ((_ extract 1 1) push__AT38) ((_ extract 1 1) push__AT38)))))))) ((_ extract 15 8) flat_data_in__AT38)) (bvand (concat (bvnot ((_ extract 1 1) push__AT38)) (concat (bvnot ((_ extract 1 1) push__AT38)) (concat (bvnot ((_ extract 1 1) push__AT38)) (concat (bvnot ((_ extract 1 1) push__AT38)) (concat (bvnot ((_ extract 1 1) push__AT38)) (concat (bvnot ((_ extract 1 1) push__AT38)) (concat (bvnot ((_ extract 1 1) push__AT38)) (bvnot ((_ extract 1 1) push__AT38))))))))) (select |af.gen_fifos[1].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT38|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT39| (store |af.gen_fifos[0].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|) (bvor (bvand (concat ((_ extract 0 0) push__AT38) (concat ((_ extract 0 0) push__AT38) (concat ((_ extract 0 0) push__AT38) (concat ((_ extract 0 0) push__AT38) (concat ((_ extract 0 0) push__AT38) (concat ((_ extract 0 0) push__AT38) (concat ((_ extract 0 0) push__AT38) ((_ extract 0 0) push__AT38)))))))) ((_ extract 7 0) flat_data_in__AT38)) (bvand (concat (bvnot ((_ extract 0 0) push__AT38)) (concat (bvnot ((_ extract 0 0) push__AT38)) (concat (bvnot ((_ extract 0 0) push__AT38)) (concat (bvnot ((_ extract 0 0) push__AT38)) (concat (bvnot ((_ extract 0 0) push__AT38)) (concat (bvnot ((_ extract 0 0) push__AT38)) (concat (bvnot ((_ extract 0 0) push__AT38)) (bvnot ((_ extract 0 0) push__AT38))))))))) (select |af.gen_fifos[0].f.entries__AT38| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT38|)))))))
(assert (= sb.ff_magic_packet.Q__AT39 (ite (= rst__AT38 #b1) #b00000000 (ite (= (bvand (bvand start__AT38 ((_ extract 0 0) push__AT38)) (bvnot sb.ff_en.Q__AT38)) #b1) ((_ extract 7 0) flat_data_in__AT38) sb.ff_magic_packet.Q__AT38))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT39 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop39 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en2_prop39 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en3_prop39 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en4_prop39 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en5_prop39 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en6_prop39 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en7_prop39 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en8_prop39 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en9_prop39 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en10_prop39 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en11_prop39 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en12_prop39 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en13_prop39 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en14_prop39 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en15_prop39 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en16_prop39 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en17_prop39 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en18_prop39 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en19_prop39 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en20_prop39 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en21_prop39 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en22_prop39 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en23_prop39 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en24_prop39 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en25_prop39 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en26_prop39 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en27_prop39 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en28_prop39 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en29_prop39 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en30_prop39 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en31_prop39 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en32_prop39 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en33_prop39 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en34_prop39 () Bool (=> (and (= sb.ff_en.Q__AT33 #b0) (= sb.ff_en.Q__AT33 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en35_prop39 () Bool (=> (and (= sb.ff_en.Q__AT34 #b0) (= sb.ff_en.Q__AT34 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en36_prop39 () Bool (=> (and (= sb.ff_en.Q__AT35 #b0) (= sb.ff_en.Q__AT35 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en37_prop39 () Bool (=> (and (= sb.ff_en.Q__AT36 #b0) (= sb.ff_en.Q__AT36 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en38_prop39 () Bool (=> (and (= sb.ff_en.Q__AT37 #b0) (= sb.ff_en.Q__AT37 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT37| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(define-fun en39_prop39 () Bool (=> (and (= sb.ff_en.Q__AT38 #b0) (= sb.ff_en.Q__AT38 #b1)) (or (= data_out_vld__AT39 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT38| |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))

(check-sat-assuming ((not (and en1_prop39 en2_prop39 en3_prop39 en4_prop39 en5_prop39 en6_prop39 en7_prop39 en8_prop39 en9_prop39 en10_prop39 en11_prop39 en12_prop39 en13_prop39 en14_prop39 en15_prop39 en16_prop39 en17_prop39 en18_prop39 en19_prop39 en20_prop39 en21_prop39 en22_prop39 en23_prop39 en24_prop39 en25_prop39 en26_prop39 en27_prop39 en28_prop39 en29_prop39 en30_prop39 en31_prop39 en32_prop39 en33_prop39 en34_prop39 en35_prop39 en36_prop39 en37_prop39 en38_prop39 en39_prop39))))



(echo "Checking property at bound 39")

(check-sat)

(pop 1)
(declare-fun |af.gen_fifos[1].f.entries__AT40| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_en.D__AT40 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT40| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT40 () (_ BitVec 8))
(declare-fun push__AT40 () (_ BitVec 2))
(declare-fun pop__AT40 () (_ BitVec 2))
(declare-fun full__AT40 () (_ BitVec 2))
(declare-fun data_out_vld__AT40 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT40| () (_ BitVec 8))
(declare-fun af.gnt__AT40 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT40| () (_ BitVec 4))
(declare-fun reqs__AT40 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT40| () (_ BitVec 4))
(declare-fun empty__AT40 () (_ BitVec 2))
(declare-fun N25__AT40 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT40| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT40| () (_ BitVec 4))
(declare-fun rst__AT40 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT40| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT40 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT40| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT40| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT40| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT40 () (_ BitVec 1))
(declare-fun data_out__AT40 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT40| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT40| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT40| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT40| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT40| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT40| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT40| () (_ BitVec 4))
(declare-fun prop_signal__AT40 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT40| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT40 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT40| () (_ BitVec 1))
(declare-fun flat_data_in__AT39 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT40| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT40 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT40| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT40 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT40| () (_ BitVec 8))
(declare-fun start__AT40 () (_ BitVec 1))
(declare-fun sb.ff_magic_packet.en__AT40 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT40 () (_ BitVec 1))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT40)) (bvnot ((_ extract 1 1) push__AT40))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT40)) (bvnot ((_ extract 0 0) push__AT40))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT40)) (bvnot ((_ extract 0 0) reqs__AT40))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT40)) (bvnot ((_ extract 1 1) reqs__AT40))) #b1))
(assert true)
(assert (= prop_signal__AT40 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT40 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT40 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) #b0000)) ((_ extract 0 0) N25__AT40))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT40 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|)) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) ((_ extract 1 1) N25__AT40))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|)) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) ((_ extract 0 0) N25__AT40))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT40 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))))))
(assert (= sb.mpt.ff_cnt.en__AT40 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT40) ((_ extract 0 0) N25__AT40)) rst__AT40) sb.ff_en.Q__AT40))))
(assert (= sb.mpt.ff_cnt.D__AT40 ((_ zero_extend 0) (ite (= rst__AT40 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) #b0000)) ((_ extract 0 0) N25__AT40))))))))
(assert (= sb.ff_magic_packet.en__AT40 ((_ zero_extend 0) (bvand (bvand start__AT40 ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))))
(assert (= sb.ff_en.en__AT40 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT40))))
(assert (= sb.ff_en.D__AT40 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT40 (bvand start__AT40 ((_ extract 0 0) push__AT40))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT40 #b00)) (bvnot (bvnot (bvcomp N25__AT40 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT40 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT40 reqs__AT40)) ((_ extract 1 1) (bvand N25__AT40 reqs__AT40))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT40 #b00))) (bvand (bvnot (bvcomp N25__AT40 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT40) (bvsub ((_ zero_extend 30) N25__AT40) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT40 ((_ zero_extend 0) N25__AT40)))
(assert (= data_out_vld__AT40 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT40 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT40 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) #b0000)) ((_ extract 0 0) N25__AT40))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT40| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|)) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) ((_ extract 0 0) N25__AT40))))))))))))
(assert (= af.gnt__AT40 ((_ zero_extend 0) N25__AT40)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT40| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT40| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|)))
(assert (= full__AT40 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|)))))))
(assert (= |af.gen_fifos[1].f.full__AT40| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT40| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT40| (concat #b000 ((_ extract 1 1) push__AT40))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT40| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT40| (concat #b000 ((_ extract 1 1) N25__AT40))))))
(assert (= empty__AT40 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT40| |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT40| |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|))))
(assert (= |af.gen_fifos[1].f.empty__AT40| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT40| |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT40| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT40) ((_ extract 1 1) N25__AT40)) rst__AT40))))
(assert (= data_out__AT40 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|)) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) (concat ((_ extract 1 1) N25__AT40) ((_ extract 1 1) N25__AT40))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|)) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) (concat ((_ extract 0 0) N25__AT40) ((_ extract 0 0) N25__AT40))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT40| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT40| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|)))
(assert (= |af.gen_fifos[0].f.full__AT40| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT40| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT40| (concat #b000 ((_ extract 0 0) push__AT40))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT40| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT40| (concat #b000 ((_ extract 0 0) N25__AT40))))))
(assert (= |af.gen_fifos[0].f.empty__AT40| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT40| |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT40| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT40) ((_ extract 0 0) N25__AT40)) rst__AT40))))
(assert (= |af.fifo_data_out[1]__AT40| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|)))))
(assert (= |af.fifo_data_out[0]__AT40| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|)))))
(assert (= rst__AT40 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT40 (ite (= rst__AT39 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT39) ((_ extract 0 0) N25__AT39)) rst__AT39) sb.ff_en.Q__AT39) #b1) (ite (= rst__AT39 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT39 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT39 #b1000)) ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)))) #b0000)) ((_ extract 0 0) N25__AT39))))) sb.mpt.ff_cnt.Q__AT39))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT40| (ite (= rst__AT39 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT39) ((_ extract 0 0) N25__AT39)) rst__AT39) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT39| (concat #b000 ((_ extract 0 0) N25__AT39))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT39|))))
(assert (= sb.ff_en.Q__AT40 (ite (= rst__AT39 #b1) #b0 (ite (= sb.ff_en.Q__AT39 #b1) #b1 (bvor sb.ff_en.Q__AT39 (bvand start__AT39 ((_ extract 0 0) push__AT39)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT40| (ite (= rst__AT39 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT39) ((_ extract 0 0) N25__AT39)) rst__AT39) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT39| (concat #b000 ((_ extract 0 0) push__AT39))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT40| (ite (= rst__AT39 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT39) ((_ extract 1 1) N25__AT39)) rst__AT39) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT39| (concat #b000 ((_ extract 1 1) N25__AT39))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT39|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT40| (ite (= rst__AT39 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT39) ((_ extract 1 1) N25__AT39)) rst__AT39) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT39| (concat #b000 ((_ extract 1 1) push__AT39))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|))))
(assert (= |af.gen_fifos[1].f.entries__AT40| (store |af.gen_fifos[1].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|) (bvor (bvand (concat ((_ extract 1 1) push__AT39) (concat ((_ extract 1 1) push__AT39) (concat ((_ extract 1 1) push__AT39) (concat ((_ extract 1 1) push__AT39) (concat ((_ extract 1 1) push__AT39) (concat ((_ extract 1 1) push__AT39) (concat ((_ extract 1 1) push__AT39) ((_ extract 1 1) push__AT39)))))))) ((_ extract 15 8) flat_data_in__AT39)) (bvand (concat (bvnot ((_ extract 1 1) push__AT39)) (concat (bvnot ((_ extract 1 1) push__AT39)) (concat (bvnot ((_ extract 1 1) push__AT39)) (concat (bvnot ((_ extract 1 1) push__AT39)) (concat (bvnot ((_ extract 1 1) push__AT39)) (concat (bvnot ((_ extract 1 1) push__AT39)) (concat (bvnot ((_ extract 1 1) push__AT39)) (bvnot ((_ extract 1 1) push__AT39))))))))) (select |af.gen_fifos[1].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT39|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT40| (store |af.gen_fifos[0].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|) (bvor (bvand (concat ((_ extract 0 0) push__AT39) (concat ((_ extract 0 0) push__AT39) (concat ((_ extract 0 0) push__AT39) (concat ((_ extract 0 0) push__AT39) (concat ((_ extract 0 0) push__AT39) (concat ((_ extract 0 0) push__AT39) (concat ((_ extract 0 0) push__AT39) ((_ extract 0 0) push__AT39)))))))) ((_ extract 7 0) flat_data_in__AT39)) (bvand (concat (bvnot ((_ extract 0 0) push__AT39)) (concat (bvnot ((_ extract 0 0) push__AT39)) (concat (bvnot ((_ extract 0 0) push__AT39)) (concat (bvnot ((_ extract 0 0) push__AT39)) (concat (bvnot ((_ extract 0 0) push__AT39)) (concat (bvnot ((_ extract 0 0) push__AT39)) (concat (bvnot ((_ extract 0 0) push__AT39)) (bvnot ((_ extract 0 0) push__AT39))))))))) (select |af.gen_fifos[0].f.entries__AT39| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT39|)))))))
(assert (= sb.ff_magic_packet.Q__AT40 (ite (= rst__AT39 #b1) #b00000000 (ite (= (bvand (bvand start__AT39 ((_ extract 0 0) push__AT39)) (bvnot sb.ff_en.Q__AT39)) #b1) ((_ extract 7 0) flat_data_in__AT39) sb.ff_magic_packet.Q__AT39))))
(push 1)
;; Property: START

(assert (not (= prop_signal__AT40 #b1)))
;; Property: END
;; block initial state
(assert (= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0))

;; Search guiding formulas

(define-fun en1_prop40 () Bool (=> (and (= sb.ff_en.Q__AT0 #b0) (= sb.ff_en.Q__AT0 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT0| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en2_prop40 () Bool (=> (and (= sb.ff_en.Q__AT1 #b0) (= sb.ff_en.Q__AT1 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en3_prop40 () Bool (=> (and (= sb.ff_en.Q__AT2 #b0) (= sb.ff_en.Q__AT2 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT2| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en4_prop40 () Bool (=> (and (= sb.ff_en.Q__AT3 #b0) (= sb.ff_en.Q__AT3 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT3| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en5_prop40 () Bool (=> (and (= sb.ff_en.Q__AT4 #b0) (= sb.ff_en.Q__AT4 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT4| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en6_prop40 () Bool (=> (and (= sb.ff_en.Q__AT5 #b0) (= sb.ff_en.Q__AT5 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT5| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en7_prop40 () Bool (=> (and (= sb.ff_en.Q__AT6 #b0) (= sb.ff_en.Q__AT6 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT6| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en8_prop40 () Bool (=> (and (= sb.ff_en.Q__AT7 #b0) (= sb.ff_en.Q__AT7 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT7| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en9_prop40 () Bool (=> (and (= sb.ff_en.Q__AT8 #b0) (= sb.ff_en.Q__AT8 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT8| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en10_prop40 () Bool (=> (and (= sb.ff_en.Q__AT9 #b0) (= sb.ff_en.Q__AT9 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT9| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en11_prop40 () Bool (=> (and (= sb.ff_en.Q__AT10 #b0) (= sb.ff_en.Q__AT10 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT10| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en12_prop40 () Bool (=> (and (= sb.ff_en.Q__AT11 #b0) (= sb.ff_en.Q__AT11 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT11| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en13_prop40 () Bool (=> (and (= sb.ff_en.Q__AT12 #b0) (= sb.ff_en.Q__AT12 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT12| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en14_prop40 () Bool (=> (and (= sb.ff_en.Q__AT13 #b0) (= sb.ff_en.Q__AT13 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT13| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en15_prop40 () Bool (=> (and (= sb.ff_en.Q__AT14 #b0) (= sb.ff_en.Q__AT14 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT14| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en16_prop40 () Bool (=> (and (= sb.ff_en.Q__AT15 #b0) (= sb.ff_en.Q__AT15 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT15| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en17_prop40 () Bool (=> (and (= sb.ff_en.Q__AT16 #b0) (= sb.ff_en.Q__AT16 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT16| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en18_prop40 () Bool (=> (and (= sb.ff_en.Q__AT17 #b0) (= sb.ff_en.Q__AT17 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT17| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en19_prop40 () Bool (=> (and (= sb.ff_en.Q__AT18 #b0) (= sb.ff_en.Q__AT18 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT18| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en20_prop40 () Bool (=> (and (= sb.ff_en.Q__AT19 #b0) (= sb.ff_en.Q__AT19 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT19| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en21_prop40 () Bool (=> (and (= sb.ff_en.Q__AT20 #b0) (= sb.ff_en.Q__AT20 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT20| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en22_prop40 () Bool (=> (and (= sb.ff_en.Q__AT21 #b0) (= sb.ff_en.Q__AT21 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT21| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en23_prop40 () Bool (=> (and (= sb.ff_en.Q__AT22 #b0) (= sb.ff_en.Q__AT22 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT22| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en24_prop40 () Bool (=> (and (= sb.ff_en.Q__AT23 #b0) (= sb.ff_en.Q__AT23 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT23| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en25_prop40 () Bool (=> (and (= sb.ff_en.Q__AT24 #b0) (= sb.ff_en.Q__AT24 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT24| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en26_prop40 () Bool (=> (and (= sb.ff_en.Q__AT25 #b0) (= sb.ff_en.Q__AT25 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT25| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en27_prop40 () Bool (=> (and (= sb.ff_en.Q__AT26 #b0) (= sb.ff_en.Q__AT26 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT26| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en28_prop40 () Bool (=> (and (= sb.ff_en.Q__AT27 #b0) (= sb.ff_en.Q__AT27 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT27| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en29_prop40 () Bool (=> (and (= sb.ff_en.Q__AT28 #b0) (= sb.ff_en.Q__AT28 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT28| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en30_prop40 () Bool (=> (and (= sb.ff_en.Q__AT29 #b0) (= sb.ff_en.Q__AT29 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT29| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en31_prop40 () Bool (=> (and (= sb.ff_en.Q__AT30 #b0) (= sb.ff_en.Q__AT30 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT30| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en32_prop40 () Bool (=> (and (= sb.ff_en.Q__AT31 #b0) (= sb.ff_en.Q__AT31 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT31| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en33_prop40 () Bool (=> (and (= sb.ff_en.Q__AT32 #b0) (= sb.ff_en.Q__AT32 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT32| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en34_prop40 () Bool (=> (and (= sb.ff_en.Q__AT33 #b0) (= sb.ff_en.Q__AT33 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT33| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en35_prop40 () Bool (=> (and (= sb.ff_en.Q__AT34 #b0) (= sb.ff_en.Q__AT34 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT34| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en36_prop40 () Bool (=> (and (= sb.ff_en.Q__AT35 #b0) (= sb.ff_en.Q__AT35 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT35| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en37_prop40 () Bool (=> (and (= sb.ff_en.Q__AT36 #b0) (= sb.ff_en.Q__AT36 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT36| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en38_prop40 () Bool (=> (and (= sb.ff_en.Q__AT37 #b0) (= sb.ff_en.Q__AT37 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT37| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en39_prop40 () Bool (=> (and (= sb.ff_en.Q__AT38 #b0) (= sb.ff_en.Q__AT38 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT38| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(define-fun en40_prop40 () Bool (=> (and (= sb.ff_en.Q__AT39 #b0) (= sb.ff_en.Q__AT39 #b1)) (or (= data_out_vld__AT40 #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT39| |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))

(check-sat-assuming ((not (and en1_prop40 en2_prop40 en3_prop40 en4_prop40 en5_prop40 en6_prop40 en7_prop40 en8_prop40 en9_prop40 en10_prop40 en11_prop40 en12_prop40 en13_prop40 en14_prop40 en15_prop40 en16_prop40 en17_prop40 en18_prop40 en19_prop40 en20_prop40 en21_prop40 en22_prop40 en23_prop40 en24_prop40 en25_prop40 en26_prop40 en27_prop40 en28_prop40 en29_prop40 en30_prop40 en31_prop40 en32_prop40 en33_prop40 en34_prop40 en35_prop40 en36_prop40 en37_prop40 en38_prop40 en39_prop40 en40_prop40))))



(echo "Checking property at bound 40")

(check-sat)

(pop 1)
(declare-fun rst__AT41 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.D__AT41| () (_ BitVec 4))
(declare-fun sb.mpt.ff_cnt.Q__AT41 () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.empty__AT41| () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.Q__AT41| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.clkEn__AT41| () (_ BitVec 1))
(declare-fun sb.ff_en.Q__AT41 () (_ BitVec 1))
(declare-fun data_out__AT41 () (_ BitVec 8))
(declare-fun |af.gen_fifos[0].f.wrPtr__AT41| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.Q__AT41| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.rdPtr__AT41| () (_ BitVec 4))
(declare-fun |af.gen_fifos[1].f.ff_rdPtr.Q__AT41| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.full__AT41| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.Q__AT41| () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.ff_wrPtr.D__AT41| () (_ BitVec 4))
(declare-fun prop_signal__AT41 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.ff_rdPtr.D__AT41| () (_ BitVec 4))
(declare-fun sb.mpt.ssa_cnt__AT41 () (_ BitVec 4))
(declare-fun |af.gen_fifos[0].f.empty__AT41| () (_ BitVec 1))
(declare-fun flat_data_in__AT40 () (_ BitVec 16))
(declare-fun |af.gen_fifos[0].f.clkEn__AT41| () (_ BitVec 1))
(declare-fun sb.mpt.ff_cnt.en__AT41 () (_ BitVec 1))
(declare-fun |af.fifo_data_out[1]__AT41| () (_ BitVec 8))
(declare-fun sb.mpt.ff_cnt.D__AT41 () (_ BitVec 4))
(declare-fun |af.fifo_data_out[0]__AT41| () (_ BitVec 8))
(declare-fun start__AT41 () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.entries__AT41| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.en__AT41 () (_ BitVec 1))
(declare-fun sb.ff_en.en__AT41 () (_ BitVec 1))
(declare-fun sb.ff_en.D__AT41 () (_ BitVec 1))
(declare-fun |af.gen_fifos[0].f.entries__AT41| () (Array (_ BitVec 3) (_ BitVec 8)))
(declare-fun sb.ff_magic_packet.Q__AT41 () (_ BitVec 8))
(declare-fun push__AT41 () (_ BitVec 2))
(declare-fun pop__AT41 () (_ BitVec 2))
(declare-fun full__AT41 () (_ BitVec 2))
(declare-fun data_out_vld__AT41 () (_ BitVec 1))
(declare-fun |af.om.interm[0]__AT41| () (_ BitVec 8))
(declare-fun af.gnt__AT41 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.wrPtr__AT41| () (_ BitVec 4))
(declare-fun reqs__AT41 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.rdPtr__AT41| () (_ BitVec 4))
(declare-fun empty__AT41 () (_ BitVec 2))
(declare-fun N25__AT41 () (_ BitVec 2))
(declare-fun |af.gen_fifos[1].f.full__AT41| () (_ BitVec 1))
(declare-fun |af.gen_fifos[1].f.ff_wrPtr.D__AT41| () (_ BitVec 4))

(assert (= (bvor (bvnot ((_ extract 1 1) full__AT41)) (bvnot ((_ extract 1 1) push__AT41))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) full__AT41)) (bvnot ((_ extract 0 0) push__AT41))) #b1))
(assert (= (bvor (bvnot ((_ extract 0 0) empty__AT41)) (bvnot ((_ extract 0 0) reqs__AT41))) #b1))
(assert (= (bvor (bvnot ((_ extract 1 1) empty__AT41)) (bvnot ((_ extract 1 1) reqs__AT41))) #b1))
(assert true)
(assert (= prop_signal__AT41 (bvor (bvnot (bvand (bvand sb.ff_en.Q__AT41 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT41 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT41 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b1000)) ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT41 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b1000)) ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))) #b0000)) ((_ extract 0 0) N25__AT41))))) #b0000))))) (bvcomp sb.ff_magic_packet.Q__AT41 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT41| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|)) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) ((_ extract 1 1) N25__AT41))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT41| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|)) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) ((_ extract 0 0) N25__AT41))))))))))))))
(assert (= sb.mpt.ssa_cnt__AT41 ((_ zero_extend 0) (bvadd sb.mpt.ff_cnt.Q__AT41 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b1000)) ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))))))
(assert (= sb.mpt.ff_cnt.en__AT41 ((_ zero_extend 0) (bvor (bvor (bvor ((_ extract 0 0) push__AT41) ((_ extract 0 0) N25__AT41)) rst__AT41) sb.ff_en.Q__AT41))))
(assert (= sb.mpt.ff_cnt.D__AT41 ((_ zero_extend 0) (ite (= rst__AT41 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT41 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b1000)) ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT41 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b1000)) ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))) #b0000)) ((_ extract 0 0) N25__AT41))))))))
(assert (= sb.ff_magic_packet.en__AT41 ((_ zero_extend 0) (bvand (bvand start__AT41 ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))))
(assert (= sb.ff_en.en__AT41 ((_ zero_extend 0) (bvnot sb.ff_en.Q__AT41))))
(assert (= sb.ff_en.D__AT41 ((_ zero_extend 0) (bvor sb.ff_en.Q__AT41 (bvand start__AT41 ((_ extract 0 0) push__AT41))))))
(assert (= (bvor (bvnot (bvcomp reqs__AT41 #b00)) (bvnot (bvnot (bvcomp N25__AT41 #b00)))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT41 #b00))) (bvnot (bvcomp (concat ((_ extract 0 0) (bvand N25__AT41 reqs__AT41)) ((_ extract 1 1) (bvand N25__AT41 reqs__AT41))) #b00))) #b1))
(assert (= (bvor (bvnot (bvnot (bvcomp reqs__AT41 #b00))) (bvand (bvnot (bvcomp N25__AT41 #b00)) (bvnot (bvnot (bvcomp (bvand ((_ zero_extend 30) N25__AT41) (bvsub ((_ zero_extend 30) N25__AT41) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))) #b1))
(assert (= pop__AT41 ((_ zero_extend 0) N25__AT41)))
(assert (= data_out_vld__AT41 ((_ zero_extend 0) (bvand (bvand sb.ff_en.Q__AT41 (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b0000))) (bvnot (bvnot (bvcomp (ite (= rst__AT41 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT41 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b1000)) ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT41 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT41 #b1000)) ((_ extract 0 0) push__AT41)) (bvnot sb.ff_en.Q__AT41)))) #b0000)) ((_ extract 0 0) N25__AT41))))) #b0000)))))))
(assert (= |af.om.interm[0]__AT41| ((_ zero_extend 0) (bvand (select |af.gen_fifos[0].f.entries__AT41| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|)) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) ((_ extract 0 0) N25__AT41))))))))))))
(assert (= af.gnt__AT41 ((_ zero_extend 0) N25__AT41)))
(assert (= |af.gen_fifos[1].f.wrPtr__AT41| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT41|)))
(assert (= |af.gen_fifos[1].f.rdPtr__AT41| ((_ zero_extend 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|)))
(assert (= full__AT41 (concat (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT41|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT41|)))) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT41|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT41|)))))))
(assert (= |af.gen_fifos[1].f.full__AT41| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|) ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT41|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|) ((_ extract 3 3) |af.gen_fifos[1].f.ff_wrPtr.Q__AT41|)))))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.D__AT41| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT41| (concat #b000 ((_ extract 1 1) push__AT41))))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.D__AT41| ((_ zero_extend 0) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT41| (concat #b000 ((_ extract 1 1) N25__AT41))))))
(assert (= empty__AT41 (concat (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT41| |af.gen_fifos[1].f.ff_wrPtr.Q__AT41|) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT41| |af.gen_fifos[0].f.ff_wrPtr.Q__AT41|))))
(assert (= |af.gen_fifos[1].f.empty__AT41| ((_ zero_extend 0) (bvcomp |af.gen_fifos[1].f.ff_rdPtr.Q__AT41| |af.gen_fifos[1].f.ff_wrPtr.Q__AT41|))))
(assert (= |af.gen_fifos[1].f.clkEn__AT41| ((_ zero_extend 0) (bvor (bvor ((_ extract 1 1) push__AT41) ((_ extract 1 1) N25__AT41)) rst__AT41))))
(assert (= data_out__AT41 (bvor (bvand (select |af.gen_fifos[1].f.entries__AT41| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|)) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) (concat ((_ extract 1 1) N25__AT41) ((_ extract 1 1) N25__AT41))))))))) (bvand (select |af.gen_fifos[0].f.entries__AT41| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|)) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) (concat ((_ extract 0 0) N25__AT41) ((_ extract 0 0) N25__AT41))))))))))))
(assert (= |af.gen_fifos[0].f.wrPtr__AT41| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT41|)))
(assert (= |af.gen_fifos[0].f.rdPtr__AT41| ((_ zero_extend 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|)))
(assert (= |af.gen_fifos[0].f.full__AT41| ((_ zero_extend 0) (bvand (bvcomp ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|) ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT41|)) (bvnot (bvcomp ((_ extract 3 3) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|) ((_ extract 3 3) |af.gen_fifos[0].f.ff_wrPtr.Q__AT41|)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.D__AT41| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT41| (concat #b000 ((_ extract 0 0) push__AT41))))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.D__AT41| ((_ zero_extend 0) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT41| (concat #b000 ((_ extract 0 0) N25__AT41))))))
(assert (= |af.gen_fifos[0].f.empty__AT41| ((_ zero_extend 0) (bvcomp |af.gen_fifos[0].f.ff_rdPtr.Q__AT41| |af.gen_fifos[0].f.ff_wrPtr.Q__AT41|))))
(assert (= |af.gen_fifos[0].f.clkEn__AT41| ((_ zero_extend 0) (bvor (bvor ((_ extract 0 0) push__AT41) ((_ extract 0 0) N25__AT41)) rst__AT41))))
(assert (= |af.fifo_data_out[1]__AT41| ((_ zero_extend 0) (select |af.gen_fifos[1].f.entries__AT41| ((_ extract 2 0) |af.gen_fifos[1].f.ff_rdPtr.Q__AT41|)))))
(assert (= |af.fifo_data_out[0]__AT41| ((_ zero_extend 0) (select |af.gen_fifos[0].f.entries__AT41| ((_ extract 2 0) |af.gen_fifos[0].f.ff_rdPtr.Q__AT41|)))))
(assert (= rst__AT41 #b0))
(assert (= sb.mpt.ff_cnt.Q__AT41 (ite (= rst__AT40 #b1) #b0000 (ite (= (bvor (bvor (bvor ((_ extract 0 0) push__AT40) ((_ extract 0 0) N25__AT40)) rst__AT40) sb.ff_en.Q__AT40) #b1) (ite (= rst__AT40 #b1) #b0000 (bvsub (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) (concat #b000 (bvand (bvnot (bvcomp (bvadd sb.mpt.ff_cnt.Q__AT40 (concat #b000 (bvand (bvand (bvnot (bvcomp sb.mpt.ff_cnt.Q__AT40 #b1000)) ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)))) #b0000)) ((_ extract 0 0) N25__AT40))))) sb.mpt.ff_cnt.Q__AT40))))
(assert (= |af.gen_fifos[0].f.ff_rdPtr.Q__AT41| (ite (= rst__AT40 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT40) ((_ extract 0 0) N25__AT40)) rst__AT40) #b1) (bvadd |af.gen_fifos[0].f.ff_rdPtr.Q__AT40| (concat #b000 ((_ extract 0 0) N25__AT40))) |af.gen_fifos[0].f.ff_rdPtr.Q__AT40|))))
(assert (= sb.ff_en.Q__AT41 (ite (= rst__AT40 #b1) #b0 (ite (= sb.ff_en.Q__AT40 #b1) #b1 (bvor sb.ff_en.Q__AT40 (bvand start__AT40 ((_ extract 0 0) push__AT40)))))))
(assert (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT41| (ite (= rst__AT40 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 0 0) push__AT40) ((_ extract 0 0) N25__AT40)) rst__AT40) #b1) (bvadd |af.gen_fifos[0].f.ff_wrPtr.Q__AT40| (concat #b000 ((_ extract 0 0) push__AT40))) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|))))
(assert (= |af.gen_fifos[1].f.ff_rdPtr.Q__AT41| (ite (= rst__AT40 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT40) ((_ extract 1 1) N25__AT40)) rst__AT40) #b1) (bvadd |af.gen_fifos[1].f.ff_rdPtr.Q__AT40| (concat #b000 ((_ extract 1 1) N25__AT40))) |af.gen_fifos[1].f.ff_rdPtr.Q__AT40|))))
(assert (= |af.gen_fifos[1].f.ff_wrPtr.Q__AT41| (ite (= rst__AT40 #b1) #b0000 (ite (= (bvor (bvor ((_ extract 1 1) push__AT40) ((_ extract 1 1) N25__AT40)) rst__AT40) #b1) (bvadd |af.gen_fifos[1].f.ff_wrPtr.Q__AT40| (concat #b000 ((_ extract 1 1) push__AT40))) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|))))
(assert (= |af.gen_fifos[1].f.entries__AT41| (store |af.gen_fifos[1].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|) (bvor (bvand (concat ((_ extract 1 1) push__AT40) (concat ((_ extract 1 1) push__AT40) (concat ((_ extract 1 1) push__AT40) (concat ((_ extract 1 1) push__AT40) (concat ((_ extract 1 1) push__AT40) (concat ((_ extract 1 1) push__AT40) (concat ((_ extract 1 1) push__AT40) ((_ extract 1 1) push__AT40)))))))) ((_ extract 15 8) flat_data_in__AT40)) (bvand (concat (bvnot ((_ extract 1 1) push__AT40)) (concat (bvnot ((_ extract 1 1) push__AT40)) (concat (bvnot ((_ extract 1 1) push__AT40)) (concat (bvnot ((_ extract 1 1) push__AT40)) (concat (bvnot ((_ extract 1 1) push__AT40)) (concat (bvnot ((_ extract 1 1) push__AT40)) (concat (bvnot ((_ extract 1 1) push__AT40)) (bvnot ((_ extract 1 1) push__AT40))))))))) (select |af.gen_fifos[1].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[1].f.ff_wrPtr.Q__AT40|)))))))
(assert (= |af.gen_fifos[0].f.entries__AT41| (store |af.gen_fifos[0].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|) (bvor (bvand (concat ((_ extract 0 0) push__AT40) (concat ((_ extract 0 0) push__AT40) (concat ((_ extract 0 0) push__AT40) (concat ((_ extract 0 0) push__AT40) (concat ((_ extract 0 0) push__AT40) (concat ((_ extract 0 0) push__AT40) (concat ((_ extract 0 0) push__AT40) ((_ extract 0 0) push__AT40)))))))) ((_ extract 7 0) flat_data_in__AT40)) (bvand (concat (bvnot ((_ extract 0 0) push__AT40)) (concat (bvnot ((_ extract 0 0) push__AT40)) (concat (bvnot ((_ extract 0 0) push__AT40)) (concat (bvnot ((_ extract 0 0) push__AT40)) (concat (bvnot ((_ extract 0 0) push__AT40)) (concat (bvnot ((_ extract 0 0) push__AT40)) (concat (bvnot ((_ extract 0 0) push__AT40)) (bvnot ((_ extract 0 0) push__AT40))))))))) (select |af.gen_fifos[0].f.entries__AT40| ((_ extract 2 0) |af.gen_fifos[0].f.ff_wrPtr.Q__AT40|)))))))
(assert (= sb.ff_magic_packet.Q__AT41 (ite (= rst__AT40 #b1) #b00000000 (ite (= (bvand (bvand start__AT40 ((_ extract 0 0) push__AT40)) (bvnot sb.ff_en.Q__AT40)) #b1) ((_ extract 7 0) flat_data_in__AT40) sb.ff_magic_packet.Q__AT40))))



