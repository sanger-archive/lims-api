curl -H 'Content-type:application/json' -H 'Accept:application/json' \
	http://localhost:9292/tubes \
	-d '{"aliquots":[{"sample_uuid":"44444444-0000-1111-0000-111111111111"}]
	}' --noproxy localhost
