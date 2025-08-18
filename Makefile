PROTOC = protoc	# команда
PROTO_DIR = exchange	# общая директория всех .proto файлов
OUT_DIR = gen	# директория для вывода сгенерированных файлов
PROTO_FILES = $(wildcard $(PROTO_DIR)/*.proto)	# файл который хотим скомпилировать

.PHONY: all gen clean tidy

all: gen

gen:
	$(PROTOC) -I $(PROTO_DIR) \
		$(PROTO_FILES) \
		--go_out=$(OUT_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative

clean:
	rm -rf $(OUT_DIR)/*.go

tidy:
	go mod tidy