import heapq

file_path = "log"
kv_pairs = []

with open(file_path, 'r') as f:
    for line in f:
        parts = line.strip().split()
        if len(parts) == 2:
            key, value_str = parts
            try:
                value = float(value_str)
                kv_pairs.append((key, value))
            except ValueError:
                continue

smallest_10 = heapq.nsmallest(10, kv_pairs, key=lambda x: x[1])

print("10 Smallest Key-Value Pairs:")
for key, value in smallest_10:
    print(f"{key} {value}")
